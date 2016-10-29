/*
 *  Copyright 2016 Magnus Madsen
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package ca.uwaterloo.flix.util

/**
  * Inspired by Dotty.
  *
  * https://github.com/lampepfl/dotty/blob/master/src/dotty/tools/dotc/printing/Highlighting.scala
  */
object Highlight {

  implicit class Helper(val sc: StringContext) extends AnyVal {
    def hl(args: Any*): String = {
      val strings = sc.parts.iterator
      val expressions = args.iterator
      val buf = new StringBuffer(strings.next)
      while(strings.hasNext) {
        buf append expressions.next
        buf append strings.next
      }
      buf.toString
    }
  }

  abstract class Highlight(color: String) {
    def text: String

    override def toString: String = color + text + Console.RESET
  }

  case class Red(text: String) extends Highlight(Console.RED)
  case class Blue(text: String) extends Highlight(Console.BLUE)
  case class Cyan(text: String) extends Highlight(Console.CYAN)
  case class Black(text: String) extends Highlight(Console.BLACK)
  case class Green(text: String) extends Highlight(Console.GREEN)
  case class White(text: String) extends Highlight(Console.WHITE)
  case class Yellow(text: String) extends Highlight(Console.YELLOW)
  case class Magenta(text: String) extends Highlight(Console.MAGENTA)

  case class RedB(text: String) extends Highlight(Console.RED_B)
  case class BlueB(text: String) extends Highlight(Console.BLUE_B)
  case class CyanB(text: String) extends Highlight(Console.CYAN_B)
  case class BlackB(text: String) extends Highlight(Console.BLACK_B)
  case class GreenB(text: String) extends Highlight(Console.GREEN_B)
  case class WhiteB(text: String) extends Highlight(Console.WHITE_B)
  case class YellowB(text: String) extends Highlight(Console.YELLOW_B)
  case class MagentaB(text: String) extends Highlight(Console.MAGENTA_B)

}
