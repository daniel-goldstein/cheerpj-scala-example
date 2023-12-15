.PHONY: clean run-java run-cheerpj

is/hail/%.class: Foo.scala
	scalac Foo.scala

hail.jar: is/hail/Foo.class is/hail/Foo$$.class
	jar cvf hail.jar $^

run-java: hail.jar
	java -cp hail.jar:scala-library-2.12.15.jar is.hail.Foo

run-cheerpj: hail.jar
	npx vite

clean:
	rm -rf is hail.jar
