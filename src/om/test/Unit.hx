package om.test;

class Unit {

	var runner = new utest.Runner();
	var report : utest.ui.common.IReport<Dynamic>;

    function new() {}

	function setup() {}

	function add( c : om.test.Case ) {
		runner.addCase( c );
    }

	function addCase( cl : Class<om.test.Case>, ?args : Array<Dynamic> ) {
		add( Type.createInstance( cl, (args != null) ? args : [] ) );
    }

	function createReport() {
		report =
			#if (js&&!nodejs)
			new utest.ui.text.HtmlReport( runner, true );
			#else
			utest.ui.Report.create( runner );
			#end
	}

	function run() {
		runner.run();
	}

	@:access(utest.Runner)
	static function main() {
		var u = new Unit();
		//if( om.test.Lib.defined( 'test_all_cases' ) ) {
		if( om.test.Lib.autoAddCases() ) {
			var clNames : Array<String> = om.test.Lib.getAllTestCaseClassNames();
			trace(clNames);
			for( cl in clNames ) u.addCase( cast Type.resolveClass( cl ) );
		}
		u.setup();
		if( u.runner.fixtures.length == 0 ) {
			trace( '0 cases added' );
			return;
		}
		//trace(u.runner.fixtures);
		//trace(u.runner.fixtures.length);
		u.createReport();
		u.run();
	}

}
