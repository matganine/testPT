package com.broceliand.graphLayout.model
{
	import org.un.cava.birdeye.ravis.graphLayout.data.Edge;
	import org.un.cava.birdeye.ravis.graphLayout.data.Graph;
	import org.un.cava.birdeye.ravis.graphLayout.data.IEdge;
	import org.un.cava.birdeye.ravis.graphLayout.data.INode;
	import org.un.cava.birdeye.ravis.graphLayout.data.Node;

	public class PTGraph extends Graph implements IPTGraph {
		
      private static const TRACE_DEBUG:Boolean = false;
      
      public function PTGraph(id:String, directional:Boolean = false, xmlsource:XML = null):void {
			super(id, directional, xmlsource);
		}
		
		
		override public function createNode(sid:String = "", o:Object = null):INode {
			
			/* we allow to pass a string id, e.g. it can originate
			 * from the XML file.*/
			
			var myid:int = ++_currentNodeId;
			var mysid:String = sid;
			var myNode:Node;
			var myaltid:int = myid;
			
			if(mysid == "") {
				mysid = myid.toString();
			}
			
			/* avoid using a duplicate string id */
			while(_nodesByStringId.hasOwnProperty(mysid)) {
				if(TRACE_DEBUG) trace("sid: "+mysid+" already in use, trying alternative");
				mysid = (++myaltid).toString();
			}
			
		
			if (o is BroPearlTree) {
			    myNode = new EndNode(myid,mysid,null, o as BroPearlTree);
			} else if((o is BroPTRootNode) || 
			            (o is BroLocalTreeRefNode) || 
                     (o is BroCoeditLocalTreeRefNode)) {
				myNode = new PTRootNode(myid,mysid,null, o as BroPTNode);
			} else if (o is BroPageNode){
				myNode = new PageNode(myid,mysid,null,o as BroPageNode);
			}else if(o is BroDistantTreeRefNode){
			   myNode = new DistantTreeRefNode(myid,mysid,null,o as BroDistantTreeRefNode);
			}
			_nodes.unshift(myNode);
			_nodesByStringId[mysid] = myNode;
			_nodesById[myid] = myNode;
			++_numberOfNodes;
			
			/* a new node means all potentially existing
			 * trees in the treemap need to be invalidated */
			purgeTrees()
			
			return myNode;
		}

		public function linkAtIndex(node1:IPTNode, node2:IPTNode, index:int,  o:Object = null):IEdge {
            
            var retEdge:IEdge;
            
            if(node1 == null) {
                throw Error("link: node1 was null");
            }
            if(node2 == null) {
                throw Error("link: node2 was null");
            }
            
            if(node1.successors.indexOf(node2) != -1) {
                trace("Link between nodes:"+node1.id+" and "+
                node2.id+" already exists, returning existing edge");
                
                var outedges:Array = node1.outEdges;
                for each (var edge:IEdge in outedges) {
                    if(edge.othernode(node1) == node2) {
                        retEdge = edge;
                        break;
                    }
                }
                if(retEdge == null) {
                    throw Error("We did not find the edge although it should be there");
                }
            } else {
                
                var newEid:int = ++_currentEdgeId;
                var newEdge:Edge = new Edge(this,null,newEid,node1,node2,o);
                _edges.unshift(newEdge);
                ++_numberOfEdges;
                
                if(!_directional) {
                    node1.addInEdge(newEdge);
                    node2.addOutEdge(newEdge);
                    
                    
                }
                retEdge = newEdge;
            }
            purgeTrees()
            return retEdge;
        
        }

	}
		
}