package om.test;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;

using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.io.Path;
using StringTools;
#end

class Lib {
	macro public static function defined(key:String):ExprOf<Bool> {
		var v = haxe.macro.Context.defined(key);
		return macro $v{v};
	}

	macro public static function findTestCases():ExprOf<Array<String>> {
		var path = haxe.macro.Context.definedValue("om_test_cases");
		if (path == null)
			path = 'test'
		else
			path = path.removeTrailingSlashes();
		var dir = Sys.getCwd() + path;
		var pos = Context.currentPos();
		if (!FileSystem.exists(dir)) {
			Context.error('test case directory not found [$dir]', pos);
			return macro null;
		}
		if (!FileSystem.isDirectory(dir))
			Context.fatalError('$dir is not directory', pos);
		var found = new Array<ExprOf<Class<om.test.Case>>>();
		for (f in FileSystem.readDirectory(dir)) {
			if (f.extension() != 'hx' || !f.startsWith('Test'))
				continue;
			var moduleMame = f.withoutExtension();
			var module = Context.getModule(moduleMame);
			found.push(macro $v{moduleMame});
			// TODO check if sub class of om.test.Case
			// TODO ? add class Case classes defines in module ?
			/*
				for( t in module ) {
					var sup = t.getClass().superClass.t.get();
					if( sup.module == 'om.test.Case' ) {
						var name = t.toString();
						found.push( macro $v{cname} );
					}
				}
			 */
		}
		if (found.length == 0)
			Context.warning('no test case classes found found in [$dir]', pos);
		return macro $a{found};
	}
}
