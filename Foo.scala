package is.hail;

object Foo {
    val defaults = Map[String, String](
      ("a" -> "a"),
      ("b" -> "b"),
      ("c" -> "c"),
      ("d" -> "d"),
      ("e" -> "e"),
    )
    def main(argv: Array[String]): Unit = {
        System.out.println(defaults)
    }
}
