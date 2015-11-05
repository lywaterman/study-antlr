java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool hehe.g4
javac hehe*.java
java org.antlr.v4.runtime.misc.TestRig hehe $1 -tree
