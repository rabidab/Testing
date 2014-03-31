using GLib;
using Gtk;
using WebKit;
using JSCore;

namespace Warung {

	public class App : GLib.Object {
		
		// Functions

		public static JSCore.Value injekrepo (Context ctx,
		JSCore.Object function,
		JSCore.Object thisObject,
		JSCore.Value[] arguments,
		out JSCore.Value exception) {

			exception = null;
			
			//its need root previlage
			try {
				Process.spawn_command_line_sync ("sudo sh "+Environment.get_current_dir()+"public/js/echo");
			} catch (SpawnError e) {
				stdout.printf ("Error: %s\n", e.message);
			}
			return new JSCore.Value.undefined (ctx);
		}

		public static JSCore.Value updaterepo (Context ctx,
		JSCore.Object function,
		JSCore.Object thisObject,
		JSCore.Value[] arguments,
		out JSCore.Value exception) {

			exception = null;
			
			//its need root previlage
			try {
				Process.spawn_command_line_async ("sudo apt-get update -y");
			} catch (SpawnError e) {
				stdout.printf ("Error: %s\n", e.message);
			}
			return new JSCore.Value.undefined (ctx);
		}

		public static JSCore.Value upgradesistem (Context ctx,
		JSCore.Object function,
		JSCore.Object thisObject,
		JSCore.Value[] arguments,
		out JSCore.Value exception) {
	
			exception = null;
			
			//run program with root previlage or run gksudo, its show a box root
			try {
				Process.spawn_command_line_async ("sudo apt-get upgrade -y");
			} catch (SpawnError e) {
				stdout.printf ("Error: %s\n", e.message);
			}
			return new JSCore.Value.undefined (ctx);
		}
		public static JSCore.Value install0 (Context ctx,
		JSCore.Object function,
		JSCore.Object thisObject,
		JSCore.Value[] arguments,
		out JSCore.Value exception) {
	
			exception = null;

			//var nama = "brasero";

			//run program with root previlage or run gksudo, its show a box root
			try {
				Process.spawn_command_line_async ("sudo apt-get install brasero -y");
			} catch (SpawnError e) {
				stdout.printf ("Error: %s\n", e.message);
			}
			return new JSCore.Value.undefined (ctx);
		}
		public static JSCore.Value install1 (Context ctx,
		JSCore.Object function,
		JSCore.Object thisObject,
		JSCore.Value[] arguments,
		out JSCore.Value exception) {
	
			exception = null;

			//var nama = "brasero";

			//run program with root previlage or run gksudo, its show a box root
			try {
				Process.spawn_command_line_async ("sudo apt-get install audacious -y");
			} catch (SpawnError e) {
				stdout.printf ("Error: %s\n", e.message);
			}
			return new JSCore.Value.undefined (ctx);
		}

		static const JSCore.StaticFunction[] js_funcs = {
			{ "injek", injekrepo, PropertyAttribute.ReadOnly },
			{ "update", updaterepo, PropertyAttribute.ReadOnly },
			{ "upgrade", upgradesistem, PropertyAttribute.ReadOnly },
			{ "pasang0", install0, PropertyAttribute.ReadOnly },
			{ "pasang1", install1, PropertyAttribute.ReadOnly },
			{ null, null, 0 }
		};

		static const ClassDefinition js_class = {
			0, // version
			ClassAttribute.None, // attribute
			"Apps", // className
			null,// parentClass
			null,// static values
			js_funcs, // static functions
			null, // initialize
			null, // finalize
			null, // hasProperty
			null, // getProperty
			null, // setProperty
			null, // deleteProperty
			null, // getPropertyNames
			null, // callAsFunction
			null, // callAsConstructor
			null, // hasInstance
			null // convertToType
		};
		
		public void setup_js_class (GlobalContext context) {
			var theClass = new Class (js_class);
			var theObject = new JSCore.Object (context, theClass, context);
			var theGlobal = context.get_global_object ();
			var id = new String.with_utf8_c_string ("Apps");
			theGlobal.set_property (context, id, theObject,
			PropertyAttribute.None, null);
		}
	}
}