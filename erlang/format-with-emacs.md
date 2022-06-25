## The IntelliJ IDEA plugin

The [Erlang plugin of IntelliJ IDEA](https://github.com/ignatov/intellij-erlang/blob/master/src/org/intellij/erlang/actions/ErlangEmacsFormatAction.java) support "Reformat With Emacs".

(part of the code)

```java
commandLine.setExePath(emacsPath);
commandLine.addParameters("--batch", "--eval");

String emacsCommand = "\n" +
"(progn (find-file \"" + virtualFile.getCanonicalPath() + "\")\n" +
"    (setq erlang-root-dir \"" + sdkPath + "\")\n" +
"    (setq load-path (cons (car (file-expand-wildcards (concat erlang-root-dir \"/lib/" + (exists ? "erlang/lib/" : "") + "tools-*/emacs\")))\n" +
"                          load-path))\n" +
"    (require 'erlang-start)\n" +
"    (erlang-mode)\n" +
"    (erlang-indent-current-buffer)\n" +
"    (delete-trailing-whitespace)\n" +
"    (untabify (point-min) (point-max))\n" +
"    (write-region (point-min) (point-max) \"" + virtualTmpFile.getCanonicalPath() + "\")\n" +
"    (kill-emacs))";

commandLine.addParameter(emacsCommand);
```

And my [VSCode extension](https://github.com/wallacegibbon/vsc-erlang-indent-with-emacs) based on the IDEA plugin:

(part of the code)

```typescript
function indent_with_emacs(current_buffer_file_path: string) {
    const config = workspace.getConfiguration("erlang_emacs_format");
    const sdk_path = (config.get("erlang_sdk_path") as string).replace(/\\/g, "/");
    return `(progn
(find-file "${current_buffer_file_path}")
(setq erlang-root-dir "${sdk_path}")
(setq load-path (cons (car (file-expand-wildcards (concat erlang-root-dir "/lib/tools-*/emacs"))) load-path))
(require 'erlang-start)
(erlang-mode)
(erlang-indent-current-buffer)
(delete-trailing-whitespace)
(untabify (point-min) (point-max))
(write-region (point-min) (point-max) "${current_buffer_file_path}")
(kill-emacs))`
        .replace(/\n/g, " ");
}
```

And my [Escript](https://github.com/wallacegibbon/erlang-indent-with-emacs) based on the IDEA plugin:

(part of the code)

```erlang
elisp(Filename, EmacsExtensionDir) ->
    ["\"(progn ",
     "(find-file \\\"", Filename, "\\\") ",
     "(setq load-path (cons \\\"", EmacsExtensionDir , "\\\" load-path)) "
     "(require 'erlang-start) ",
     "(erlang-mode) ",
     "(erlang-indent-current-buffer) ",
     "(delete-trailing-whitespace) ",
     "(untabify (point-min) (point-max)) ",
                                                %  "(tabify (point-min) (point-max)) ",
     "(write-region (point-min) (point-max) \\\"", Filename, "\\\") "
     "(kill-emacs) ",
     ")\""].
```