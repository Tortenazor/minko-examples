/**
 * Created with IntelliJ IDEA.
 * User: mickael
 * Date: 22/04/12
 * Time: 17:54
 * To change this template use File | Settings | File Templates.
 */
package aerys.minko.example.core.skybox
{
	
	import aerys.minko.render.effect.Effect;
	import aerys.minko.render.resource.texture.CubeTextureResource;
	import aerys.minko.scene.controller.camera.ArcBallController;
	import aerys.minko.scene.node.mesh.Mesh;
	import aerys.minko.scene.node.mesh.geometry.primitive.CubeGeometry;
	
	public class SkyboxExample extends MinkoExampleApplication
	{
		[Embed(source="../assets/skybox/negx.jpg")]
		private static const NEG_X : Class;
		
		[Embed(source="../assets/skybox/negy.jpg")]
		private static const NEG_Y : Class;
		
		[Embed(source="../assets/skybox/negz.jpg")]
		private static const NEG_Z : Class;
		
		[Embed(source="../assets/skybox/posx.jpg")]
		private static const POS_X : Class;
		
		[Embed(source="../assets/skybox/posy.jpg")]
		private static const POS_Y : Class;
		
		[Embed(source="../assets/skybox/posz.jpg")]
		private static const POS_Z : Class;
		
	    override protected function initializeScene() : void
		{
			super.initializeScene();
			
			// lock camera to center
			ArcBallController(camera.getController(1)).distanceStep = 0;
			
			// create cubemap
			var texture : CubeTextureResource = new CubeTextureResource(1024);
			texture.setContentFromBitmapDatas(
				new POS_X().bitmapData,
				new NEG_X().bitmapData,
				new POS_Y().bitmapData,
				new NEG_Y().bitmapData,
				new POS_Z().bitmapData,
				new NEG_Z().bitmapData,
				true
			);
			
			// create geometry with custom shader.
	        var skybox : Mesh = new Mesh(
				CubeGeometry.cubeGeometry,
				{ diffuseCubeMap: texture }, 
				new Effect(new SkyBoxShader())
			);
			
			skybox.transform.setScale(50, 50, 50);
			
	        scene.addChild(skybox);
	    }
	}
}
