/*
 *  Copyright 2023 Stephen Tetley
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

mod TestToJava {

    /////////////////////////////////////////////////////////////////////////////
    // Chain                                                                   //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def chainToJava01(): Bool \ IO =
        import static java.util.List.of(): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava((Chain.empty() : Chain[String]));
        equals(of(), checked_cast(l))

    @test
    def chainToJava02(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Chain.singleton("one"));
        equals(of(checked_cast("one")), checked_cast(l))

    @test
    def chainToJava03(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object, ##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Chain.cons("one", Chain.singleton("two")));
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(l))

    /////////////////////////////////////////////////////////////////////////////
    // List                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def listToJava01(): Bool \ IO =
        import static java.util.List.of(): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava((Nil : List[String]));
        equals(of(), checked_cast(l))

    @test
    def listToJava02(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(List#{"one"});
        equals(of(checked_cast("one")), checked_cast(l))

    @test
    def listToJava03(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object, ##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(List#{"one", "two"});
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(l))

    /////////////////////////////////////////////////////////////////////////////
    // Map                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def mapToJava01(): Bool \ IO =
        import static java.util.Map.of(): ##java.util.Map \ {};
        import java.util.Map.equals(##java.lang.Object): Bool \ {};
        let m: ##java.util.Map = ToJava.toJava((Map#{} : Map[String, String]));
        equals(of(), checked_cast(m))

    @test
    def mapToJava02(): Bool \ IO =
        import static java.util.Map.of(##java.lang.Object, ##java.lang.Object): ##java.util.Map \ {};
        import java.util.Map.equals(##java.lang.Object): Bool \ {};
        let m: ##java.util.Map = ToJava.toJava(Map#{"a" => "one"});
        equals(of(checked_cast("a"), checked_cast("one")), checked_cast(m))

    @test
    def mapToJava03(): Bool \ IO =
        import static java.util.Map.of(##java.lang.Object, ##java.lang.Object, ##java.lang.Object, ##java.lang.Object): ##java.util.Map \ {};
        import java.util.Map.equals(##java.lang.Object): Bool \ {};
        let m: ##java.util.Map = ToJava.toJava(Map#{"a" => "one", "b" => "two"});
        equals(of(checked_cast("a"), checked_cast("one"), checked_cast("b"), checked_cast("two")), checked_cast(m))

    /////////////////////////////////////////////////////////////////////////////
    // Nec                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def necToJava01(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Nec.singleton("one"));
        equals(of(checked_cast("one")), checked_cast(l))

    @test
    def necToJava02(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object, ##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Nec.cons("one", Nec.singleton("two")));
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(l))

    /////////////////////////////////////////////////////////////////////////////
    // Nel                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def nelToJava01(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Nel.singleton("one"));
        equals(of(checked_cast("one")), checked_cast(l))

    @test
    def nelToJava02(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object, ##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let l: ##java.util.List = ToJava.toJava(Nel.cons("one", Nel.singleton("two")));
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(l))

    /////////////////////////////////////////////////////////////////////////////
    // Set                                                                     //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def setToJava01(): Bool \ IO =
        import static java.util.Set.of(): ##java.util.Set \ {};
        import java.util.Set.equals(##java.lang.Object): Bool \ {};
        let s: ##java.util.Set = ToJava.toJava((Set#{} : Set[String]));
        equals(of(), checked_cast(s))

    @test
    def setToJava02(): Bool \ IO =
        import static java.util.Set.of(##java.lang.Object): ##java.util.Set \ {};
        import java.util.Set.equals(##java.lang.Object): Bool \ {};
        let s: ##java.util.Set = ToJava.toJava(Set#{"one"});
        equals(of(checked_cast("one")), checked_cast(s))

    @test
    def setToJava03(): Bool \ IO =
        import static java.util.Set.of(##java.lang.Object, ##java.lang.Object): ##java.util.Set \ {};
        import java.util.Set.equals(##java.lang.Object): Bool \ {};
        let s: ##java.util.Set = ToJava.toJava(Set#{"one", "two"});
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(s))

    /////////////////////////////////////////////////////////////////////////////
    // Vector                                                                  //
    /////////////////////////////////////////////////////////////////////////////

    @test
    def vectorToJava01(): Bool \ IO =
        import static java.util.List.of(): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let v: ##java.util.List = ToJava.toJava((Vector#{} : Vector[String]));
        equals(of(), checked_cast(v))

    @test
    def vectorToJava02(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let v: ##java.util.List = ToJava.toJava(Vector#{"one"});
        equals(of(checked_cast("one")), checked_cast(v))

    @test
    def vectorToJava03(): Bool \ IO =
        import static java.util.List.of(##java.lang.Object, ##java.lang.Object): ##java.util.List \ {};
        import java.util.List.equals(##java.lang.Object): Bool \ {};
        let v: ##java.util.List = ToJava.toJava(Vector#{"one", "two"});
        equals(of(checked_cast("one"), checked_cast("two")), checked_cast(v))

}
