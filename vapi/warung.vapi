/* warung.vapi generated by valac 0.20.1, do not modify. */

namespace Warung {
	namespace Util {
		[CCode (cheader_filename = "warung.h")]
		public static void evaluate_callback (JSCore.Context ctx, string callback, string args);
		[CCode (cheader_filename = "warung.h")]
		public static string string_from_js_string (JSCore.String s);
		[CCode (cheader_filename = "warung.h")]
		public static string string_property_from_value (JSCore.Context ctx, JSCore.Value val, string property_name);
	}
	[CCode (cheader_filename = "warung.h")]
	public class App : GLib.Object {
		public App ();
		public static JSCore.Value injekrepo (JSCore.Context ctx, JSCore.Object function, JSCore.Object thisObject, JSCore.Value[] arguments, out JSCore.Value exception);
		public static JSCore.Value install0 (JSCore.Context ctx, JSCore.Object function, JSCore.Object thisObject, JSCore.Value[] arguments, out JSCore.Value exception);
		public static JSCore.Value install1 (JSCore.Context ctx, JSCore.Object function, JSCore.Object thisObject, JSCore.Value[] arguments, out JSCore.Value exception);
		public void setup_js_class (JSCore.GlobalContext context);
		public static JSCore.Value updaterepo (JSCore.Context ctx, JSCore.Object function, JSCore.Object thisObject, JSCore.Value[] arguments, out JSCore.Value exception);
		public static JSCore.Value upgradesistem (JSCore.Context ctx, JSCore.Object function, JSCore.Object thisObject, JSCore.Value[] arguments, out JSCore.Value exception);
	}
	[CCode (cheader_filename = "warung.h")]
	public class Main : WebKit.WebView {
		public Main ();
		public void* context { get; set; }
	}
}
