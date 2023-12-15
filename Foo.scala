package is.hail;

import scala.collection.immutable.Map;

object Foo {
    val bar: Map[String, String] = Map.empty
    def main(argv: Array[String]): Unit = {
        System.out.println(argv)
    }
}
