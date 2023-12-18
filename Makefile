.PHONY: clean run-java run-cheerpj

SCALA_VERSION ?= 2.12.18

JARS := cheerpj-scala-example/scala-library.jar cheerpj-scala-example/hail.jar

cheerpj-scala-example/scala-library.jar:
	curl -o $@ https://repo1.maven.org/maven2/org/scala-lang/scala-library/$(SCALA_VERSION)/scala-library-$(SCALA_VERSION).jar

is/hail/%.class: Foo.scala
	scalac Foo.scala

cheerpj-scala-example/hail.jar: is/hail/Foo.class is/hail/Foo$$.class
	jar cvf $@ $^

run-java: $(JARS)
	java -cp hail.jar:scala-library.jar is.hail.Foo "Hello world!"

run-cheerpj: $(JARS)
	npx vite

clean:
	rm -rf is $(JARS)
