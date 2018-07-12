package om.test;

import utest.Assert;
import haxe.PosInfos;

@:keepSub
class Case {

	public function new() {}

    inline function isTrue( cond : Bool, ?msg : String, ?pos : PosInfos ) {
        Assert.isTrue( cond, msg, pos );
    }

    inline function isFalse( cond : Bool, ?msg : String, ?pos : PosInfos ) {
        Assert.isFalse( cond, msg, pos );
    }

    inline function isNull( value : Dynamic, ?msg : String, ?pos : PosInfos ) {
        Assert.isNull( value, msg, pos );
    }

    inline function notNull( value : Dynamic, ?msg : String, ?pos : PosInfos ) {
        Assert.notNull( value, msg, pos );
    }

    inline function is( value : Dynamic, type : Dynamic, ?msg : String , ?pos : PosInfos ) {
        Assert.is( value, type, msg, pos );
    }

    inline function notEquals( expected : Dynamic, value : Dynamic, ?msg : String , ?pos : PosInfos ) {
        Assert.notEquals( expected, value, msg, pos );
    }

    inline function equals( expected : Dynamic, value : Dynamic, ?msg : String , ?pos : PosInfos ) {
        Assert.equals( expected, value, msg, pos );
    }

    inline function match( pattern : EReg, value : Dynamic, ?msg : String , ?pos : PosInfos ) {
        Assert.match( pattern, value, msg, pos );
    }

    inline function floatEquals( expected : Float, value : Float, ?approx : Float, ?msg : String , ?pos : PosInfos ) {
        Assert.floatEquals( expected, value, value, msg, pos );
    }

    inline function same( expected : Dynamic, value : Dynamic, ?recursive : Bool, ?msg : String, ?pos : PosInfos ) {
        Assert.same( expected, value, recursive, msg, pos );
    }

    inline function raises( method : Void->Void, ?type : Class<Dynamic>, ?msgNotThrown : String , ?msgWrongType : String, ?pos : PosInfos ) {
        Assert.raises( method, type, msgNotThrown, msgWrongType, pos );
    }

    inline function allows<T>( possibilities : Array<T>, value : T, ?msg : String , ?pos : PosInfos ) {
        Assert.allows( possibilities, value, msg, pos );
    }

    inline function contains<T>( match : T, values : Array<T>, ?msg : String , ?pos : PosInfos ) {
        Assert.contains( match, values, msg, pos );
    }

    inline function notContains<T>( match : T, values : Array<T>, ?msg : String , ?pos : PosInfos ) {
        Assert.notContains( match, values, msg, pos );
    }

    inline function stringContains( match : String, value : String, ?msg : String , ?pos : PosInfos ) {
        Assert.stringContains( match, value, msg, pos );
    }

    inline function fail( ?msg : String, ?pos : PosInfos ) {
        Assert.fail( msg, pos );
    }

    inline function warn( msg : String ) {
        Assert.warn( msg );
    }

	/*
    inline function createAsync( ?f : Void->Void, ?timeout : Int ) {
        return Assert.createAsync( f, timeout );
    }
	*/

    inline function createEvent<T>( f : T->Void, ?timeout : Int ) {
        Assert.createEvent( f, timeout );
    }

}
