# greeting text
set fish_greeting \> Too Young Too Simple, Sometimes Naive \<

# JAVA and android
switch (uname)
case Darwin
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
    if test -d "$JAVA_HOME"
        set CLASS_PATH $JAVA_HOME/lib/dt.jar $JAVA_HOME/lib/tools.jar
        set -gx PATH $JAVA_HOME/bin $PATH
    end

    # android sdk
    set -gx ANDROID_HOME $HOME/Library/Android/sdk
    if test -d  "$ANDROID_HOME"
        set -gx PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $PATH
    end
end

# npm
set NPM_HOME $HOME/.config/npm
if test -d "$NPM_HOME/bin"
    set -gx PATH $NPM_HOME/bin $PATH
end

# rustup
set CARGO_HOME $HOME/.cargo
if test -d "$CARGO_HOME"
    set -gx PATH $CARGO_HOME/bin $PATH
end

# flutter
set FLUTTER_HOME $HOME/sdk/flutter
if test -d "$FLUTTER_HOME/bin"
    set -gx PATH $FLUTTER_HOME/bin $PATH
    set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
    set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
end
if test -d "$FLUTTER_HOME/bin/cache/dart-sdk/bin"
    set -gx PATH $FLUTTER_HOME/bin/cache/dart-sdk/bin $PATH
end
if test -d "$HOME/.pub-cache/bin"
    set -gx PATH $HOME/.pub-cache/bin $PATH
end

# fish proxy
set proxy_host 127.0.0.1:49501
set proxy_auth false

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source $HOME'/google-cloud-sdk/path.fish.inc'; else; . $HOME'/google-cloud-sdk/path.fish.inc'; end; end

# pj plugin
set -gx PROJECT_PATHS ~/ ~/workspace/pxn ~/development

# nvim alias for n
function n
    if test -z $argv
        nvim (fzf --preview "type bat 2> /dev/null; and bat --style=numbers --color=always {}; or type highlight 2> /dev/null; and highlight -O ansi -l {}; or type coderay 2> /dev/null; and coderay {}; or type rougify 2> /dev/null; and rougify {}; or cat {}")
    else
        nvim $argv
    end
end

# rbenv
if test -d "$HOME/.rbenv/shims"
    set -gx PATH $HOME/.rbenv/shims $PATH
end
