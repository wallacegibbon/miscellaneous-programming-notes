## The IntelliJ IDEA plugin

This is how the [Erlang plugin of IntelliJ IDEA](https://github.com/ignatov/intellij-erlang/blob/master/src/org/intellij/erlang/actions/ErlangEmacsFormatAction.java) do the reformatting-with-emacs:

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

