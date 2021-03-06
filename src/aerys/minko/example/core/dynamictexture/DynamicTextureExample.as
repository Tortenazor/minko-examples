package aerys.minko.example.core.dynamictexture
{
	import aerys.minko.scene.controller.mesh.DynamicTextureController;
	import aerys.minko.scene.node.mesh.Mesh;
	import aerys.minko.scene.node.mesh.geometry.primitive.CubeGeometry;

	public class DynamicTextureExample extends MinkoExampleApplication
	{
		[Embed("../assets/minko_logo.swf")]
		private static const MINKO_LOGO_SWF	: Class;
		
		override protected function initializeScene() : void
		{
			super.initializeScene();
			
			var cube : Mesh = new Mesh(CubeGeometry.cubeGeometry);
			
			cube.addController(new DynamicTextureController(
				new MINKO_LOGO_SWF(),
				512, 512
			));
			
			scene.addChild(cube);
		}
	}
}