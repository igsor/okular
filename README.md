# okular
Okular with an additional annotation tool

The motivation for this is interoperation with Docear. Docear reads the content of annotations but not highlighted text. On default, Okular highlights text, but leaves the annotation empty.

This topic was discussed in [kde-bugs](http://kde-bugs-dist.kde.narkive.com/OLrGrjHW/okular-bug-321992-feature-request-can-the-highlighter-automatically-fill-the-attached-pop-up-note)and [superuser](http://superuser.com/questions/673917/modify-okular-highlight-to-automatically-copy-highlighted-text-into-comment). In response, a small modification was suggested by [jsqlio](https://github.com/jsqlio/okular). This code is inspired by this small set of changes, in fact the code is reused. But instead of changing the default highlighter behaviour, a new parameter (key) is introduced. Only if key is checked, the selected text is copied into a note. Furthermore, a key text can be specified, wrapping the selected text xml-style ("<key>selected text</key>") in the note. With this, the highlights can be classified and the text easily filtered by a downstream application.

This leaves the choice what to do to the user. One can distinguish highlighted ares which will be imported into Docear (key checked, blank text) and ones which are not (key not checked). If applicable, downstream filtering can be achieved by having key checked and an additional text.

This repository was cloned from the [kde git repo](git://anongit.kde.org/okular) with modifications in the edit branch. For building, please see the [Dockerfile](https://raw.githubusercontent.com/igsor/okular/edit/Dockerfile). It sets up an Ubuntu 16.04 build environment for Okular. Follow the instructions in the Dockerfile itself.

No guarantees whatsoever are given. The software is highly experimental and hardly tested. Use at your own risk.

