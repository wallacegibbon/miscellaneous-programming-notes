import http from "http";
import child_process from "child_process";
import path from "path";
import git_backend from "git-http-backend";
import zlib from "zlib";

const http_port = 5000;
const script_dir = new URL(".", import.meta.url).pathname;

const server = http.createServer(function (req, res) {
  const repo = req.url.split("/")[1];
  const dir = path.join(script_dir, "repos", repo);
  const req_stream = req.headers["content-encoding"] == "gzip"
    ? req.pipe(zlib.createGunzip())
    : req;

  req_stream.pipe(git_backend(req.url, function (err, service) {
    if (err) { return res.end(err + "\n"); }

    res.setHeader("content-type", service.type);
    console.log(service.action, repo, service.fields);

    const ps = child_process.spawn(service.cmd, service.args.concat(dir));
    ps.stdout.pipe(service.createStream()).pipe(ps.stdin);
  })).pipe(res);
});

server.listen(http_port);

console.log(`server is listening on port ${http_port}...`);
console.log(`\t(repos directory: ${script_dir}repos)`);
