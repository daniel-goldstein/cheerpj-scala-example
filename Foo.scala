package is.hail;

// Without this import, `scalac` will compile Foo$.class to load `scala.Predef$`,
// which creates the `Map` type alias. Something about `scala.Predef$` explodes
// in CheerpJ.
// If you uncomment this line, then `scalac`
// does not appear to insert a load of scala.Predef
// into the bytecode and running Foo.main in CJ succeeds
// import scala.collection.immutable.Map;

object Foo {
    val bar: Map[String, String] = Map.empty
    def main(argv: Array[String]): Unit = {
        System.out.println(argv(0))
    }
}
