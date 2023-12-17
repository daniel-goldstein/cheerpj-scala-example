.PHONY: clean run-java run-cheerpj

SCALA_VERSION ?= 2.12.18

scala-library.jar:
	curl -o scala-library.jar https://repo1.maven.org/maven2/org/scala-lang/scala-library/$(SCALA_VERSION)/scala-library-$(SCALA_VERSION).jar

is/hail/%.class: Foo.scala
	scalac Foo.scala

hail.jar: is/hail/Foo.class is/hail/Foo$$.class
	jar cvf hail.jar $^

run-java: hail.jar scala-library.jar
	java -cp hail.jar:scala-library.jar is.hail.Foo "Hello world!"

run-cheerpj: hail.jar scala-library.jar
	npx vite

clean:
	rm -rf is *.jar
