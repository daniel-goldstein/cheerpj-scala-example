.PHONY: clean run-java run-cheerpj

scala-library.jar:
	curl -o scala-library.jar https://repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.12/scala-library-2.13.12.jar

is/hail/%.class: Foo.scala
	scalac Foo.scala

hail.jar: is/hail/Foo.class is/hail/Foo$$.class
	jar cvf hail.jar $^

run-java: hail.jar scala-library.jar
	java -cp hail.jar:scala-library.jar is.hail.Foo

run-cheerpj: hail.jar
	npx vite

clean:
	rm -rf is hail.jar
