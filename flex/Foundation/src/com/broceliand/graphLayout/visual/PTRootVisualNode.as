package com.broceliand.graphLayout.visual
{
	import mx.core.UIComponent;
	
	import org.un.cava.birdeye.ravis.graphLayout.data.INode;
	import org.un.cava.birdeye.ravis.graphLayout.visual.IVisualGraph;
	
	public class PTRootVisualNode extends PTVisualNodeBase
	{
		public function PTRootVisualNode(vg:IVisualGraph, node:INode, id:int, view:UIComponent = null, data:Object = null, mv:Boolean = true):void {
			super(vg, node, id, view, data, mv);
		}
		
		override public function set view(v:UIComponent):void {
			super.view = v;
			_pearlRenderer = IUIPearl(v);

		}		
	}
}