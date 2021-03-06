/**
 * 	Generated by mxmlc 2.0
 *
 *	Package:	Components
 *	Class: 		DAGPath
 *	Source: 	C:\GitHub\caTissue_Plus_CZ\flexclient\dag\Components\DAGPath.mxml
 *	Template: 	flex2/compiler/mxml/gen/ClassDef.vm
 *	Time: 		2014.06.11 16:40:47 CEST
 */

package Components
{

import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.filters.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.utils.IExternalizable;
import flash.xml.*;
import mx.binding.*;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.styles.*;



public class DAGPath
	extends mx.core.UIComponent
	implements flash.utils.IExternalizable
{





    /**
     * @private
     **/
	public function DAGPath()
	{
		super();


		//	our style settings



		//	properties

		//	events
		this.addEventListener("creationComplete", ___UIComponent1_creationComplete);

	}

    /**
     * @private
     **/
	override public function initialize():void
	{



		super.initialize();
	}


		import mx.controls.Menu;
		import mx.controls.Alert;
		import mx.events.MenuEvent;
		import Components.DAGNode;
		import Components.Association;
		import mx.rpc.events.ResultEvent;
		import mx.collections.ArrayCollection;
		import Components.DAGConstants;

		[Bindable]
		public var isSelected:Boolean=false;
		[Bindable]
		public var sourceExpId:int = 0;
		[Bindable]
		public var destinationExpId:int=0;		
		[Bindable]
		public var operatorIndex:int=0;
		private var x1:int;
	    private var y1:int;
	    private var x2:int;
	    private var y2:int;
	    private var fromNode:DAGNode;
	    private var toNode:DAGNode;
     	private var isMousOver:Boolean=false;
   	    private var thicknessNumber:uint = 2;
	    private var alphaNumber:uint = 4.0;
	    private var arrowWidth:int = 4;
	    private var arrowHeight:int = 8;
        private var color:uint = 0x000000;
     	
     	/**
     	* Init method for DAGPath
     	*/
	    public function init() : void
	    {
	    	this.addEventListener(MouseEvent.CLICK,createAndShow); 
			this.addEventListener(MouseEvent.MOUSE_OVER,select);
 			this.addEventListener(MouseEvent.MOUSE_OUT,unSelect);
	    }
	    /**
	    * Gets path's starting x co-ordinate
	    */	    
	    public function getX1():int{
	  	  return this.x1;
	  	}
	    /**
	    * Sets path's starting x co-ordinate
	    */	
	  	public function setX1(value:int):void{
	  	  this.x1 = value;
	  	}
	    /**
	    * Gets path's starting y co-ordinate
	    */	
	  	public function getY1():int{
	  	  return this.y1;
	  	}
	    /**
	    * Sets path's starting y co-ordinate
	    */	
	  	public function setY1(value:int):void{
	  	  this.y1 = value;
	  	}
	    /**
	    * Gets path's end point x co-ordinate
	    */	
	  	public function getX2():int{
	  	  return this.x2;
	  	}
	  	/**
	    * Sets path's end point x co-ordinate
	    */	
	  	public function setX2(value:int):void{		
	  	  this.x2 = value;
	  	}
	    /**
	    * Gets path's end point y co-ordinate
	    */	
	  	public function getY2():int{
	  	  return this.y2;
	  	}
	  	/**
	    * Sets path's end point y co-ordinate
	    */	
	  	public function setY2(value:int):void{
	  	  this.y2 = value;
	  	}
	  	/**
	  	* Sets path's source node
	  	*/
	  	 public function setFromNode(value:DAGNode):void{
	      this.fromNode = value;
	    }
	    /**
	  	* Sets path's destination node
	  	*/
	    public function setToNode(value:DAGNode):void{
	      this.toNode = value;
	    }
	    /**
	  	* Gets path's source node
	  	*/
	     public function getFromNode():DAGNode{
	      return this.fromNode;
	    }
	    /**
	  	* Gets path's destination node
	  	*/
	    public function getToNode():DAGNode{
	      return this.toNode;
	    }
	    
		/**
		* Read serialized data
		*/		
		public function readExternal(input:IDataInput):void {
			toolTip=input.readUTF();
			id = input.readUTF();
			isSelected = input.readBoolean();
			sourceExpId=input.readInt();
			destinationExpId= input.readInt();
		}
		/**
		* Write serialized data.
		*/
		public function writeExternal(out:IDataOutput):void {
			out.writeUTF(toolTip);
			out.writeUTF(id);
			out.writeBoolean(isSelected);
			out.writeInt(sourceExpId);
			out.writeInt(destinationExpId);
		}
		
		[Bindable]
		public var menuData:Array = [	
		{label: "Odstranit", type: "radio", toggled: false}
		];
		
		/**
		* Show delete menu on path
		*/
		public function createAndShow(event:MouseEvent):void {
			var myMenu:Menu=null;
			myMenu = Menu.createMenu(this, menuData, true);
			myMenu.show(event.stageX,event.stageY);
			myMenu.addEventListener(MenuEvent.ITEM_CLICK,deletePathHandler);
		}
		/**
		* Delete path
		*/
		public function deletePath(dagNode1:DAGNode,dagNode2:DAGNode):void
		{
			var node1:String=dagNode1.name;
			var node2:String=dagNode2.name;
			var ass:Association=dagNode1.getOutAssociation(node2);
			if(ass != null)
			{
				if(dagNode1.nodeType==DAGConstants.VIEW_ONLY_NODE)
				{
					dagNode1.removeOutAssociation(node2,ass.associatedLink);
				}
				else
				{
					dagNode1.removeDisplayOutAssociation(node2,ass.associatedLink);
					dagNode1.removeOutAssociation(node2,ass.associatedLink);
				}
				dagNode1.orderOfAss.remove(ass.associatedLink);
				dagNode2.removeInAssociation(node1,ass.associatedLink);
				node1="";
				node2="";
				this.parentApplication.rpcService.addEventListener(ResultEvent.RESULT,deleteLinkHandler);
				var nodeList:ArrayCollection = new ArrayCollection();
				nodeList.addItemAt(dagNode1,0);
				nodeList.addItemAt(dagNode2,1);
				this.parentApplication.rpcService.deleteLink(nodeList,ass.associatedLink)
				this.parent.removeChild(this.parent.getChildByName(ass.associatedLink));
				this.parentApplication.dagPathUIMap.remove(this.name);
				
			}
			else
			{
				Alert.show("Selected nodes do not have any association");
			}
		}	
		/**
		* Delete path handler
		*/
		public function deletePathHandler(event:MenuEvent):void		
		{
			if(event.label==DAGConstants.DELETE)
			{
				
				var dagPath:DAGPath = this.parentApplication.dagPathUIMap.getValue(this.name);
				var node1:String=dagPath.sourceExpId+"";
				var node2:String=dagPath.destinationExpId+"";
				var dagNode1:DAGNode = DAGNode(this.parent.getChildByName(node1));
				var dagNode2:DAGNode = DAGNode(this.parent.getChildByName(node2));
				deletePath(dagNode1,dagNode2);
			}
				
		}
		/**
		* RPC handler for delete path
		*/
		public function deleteLinkHandler(event:ResultEvent):void
		{
			this.parentApplication.rpcService.removeEventListener(ResultEvent.RESULT,deleteLinkHandler,false);
			this.parentApplication.currentExp.text = this.parentApplication.getExprssionString();	
		}
		/**
		* Select Link
		*/
		private function select(event:MouseEvent):void {
		
			if (!this.isMousOver)
			{
				this.color = 0x0000ff;
		     	this.isMousOver = true;
	        }
	        draw();
		}
		/**
		* Unselect link
		*/
		private function unSelect(event:MouseEvent):void {
				if (this.isMousOver)
				{
					this.color = 0x000000;
			        this.isMousOver = false;
		        }
		        draw();
		}
		/**
		* Draw path on DAG
		*/
		 public function draw():void{
		      calculateCoordinate();
		  	  graphics.clear();
		  	  //this transparent line for easy selection
		  	  graphics.lineStyle(8,color,0.0);
		  	  graphics.moveTo(getX1(),getY1());
		  	  graphics.lineTo(getX2(),getY2());
		  	  //this is real line
		  	  graphics.lineStyle(thicknessNumber,color,alphaNumber);
		  	  graphics.moveTo(getX1(),getY1());
		  	  graphics.lineTo(getX2(),getY2());
		  	  createArrow();
	    }
	    /**
		* Draw the arrow
		*/
	  	private function createArrow():void{
	  	  var angle:Number = Math.atan2(getY2()-getY1(), getX2()-getX1());
	  	  graphics.lineTo(getX2()-arrowHeight*Math.cos(angle)-arrowWidth*Math.sin(angle),
	  									getY2()-arrowHeight*Math.sin(angle)+arrowWidth*Math.cos(angle));
	  	  graphics.lineTo(getX2(), getY2());
	  	  graphics.lineTo(getX2()-arrowHeight*Math.cos(angle)+arrowWidth*Math.sin(angle),	
	  									getY2()-arrowHeight*Math.sin(angle)-arrowWidth*Math.cos(angle));										
	  	}
		/**
		* Calculation of co-ordinates
		*/	
		private function calculateCoordinate():void{
	  	  var drawDirection:String = getDrawDirection();
	  	  var fromNodeX2:int = fromNode.getX()+fromNode.getWidth();
	  	  var fromNodeY2:int = fromNode.getY()+fromNode.getHeight();
	  	  var toNodeX2:int = toNode.getX()+toNode.getWidth();
	  	  var toNodeY2:int = toNode.getY()+toNode.getHeight();
	  	  var diffY:int = 0;
	  	  var diffX:int = 0;
	  	  
	  	  if (drawDirection =="BOTTOM" || drawDirection =="TOP")
	  	  {
	    		if (fromNode.getX()<=toNode.getX() && fromNodeX2>=toNodeX2){					
	    		  diffX =(toNode.getWidth())/2;
	    		  diffX = toNode.getX() + diffX;				
	    		}
	    		else if (fromNode.getX()>toNode.getX() && fromNodeX2>toNodeX2){					
	    		  diffX =(toNodeX2 - fromNode.getX())/2;
	    		  diffX = fromNode.getX() + diffX;				
	    	  }
	    	  else if (fromNode.getX()<toNode.getX() && fromNodeX2<toNodeX2){					
	    		  diffX =(fromNodeX2 - toNode.getX())/2;
	    		  diffX = toNode.getX() + diffX;				
	    		}
	    		else if (fromNode.getX()>toNode.getX() && fromNodeX2<toNodeX2){					
	    		  diffX =(fromNode.getWidth())/2;
	    		  diffX = fromNode.getX() + diffX;
	    		}
	    	  if (diffX == 0){
	    		  diffX = fromNode.getX() + (fromNode.getWidth()/2);
	    		}
	  	  }
	  	  if (drawDirection =="RIGHT" || drawDirection =="LEFT" ){				
	    		if (fromNode.getY()<=toNode.getY() && fromNodeY2>=toNodeY2){				
	    		  diffY =(toNodeY2 - toNode.getY())/2;					
	    		  diffY = toNode.getY() + diffY;						
	    		}
	    		else if (fromNode.getY()>toNode.getY() && fromNodeY2>toNodeY2){					
	    		  diffY =(toNodeY2 - fromNode.getY())/2;
	    		  diffY = fromNode.getY() + diffY;
	    		}
	    		else if (fromNode.getY()<toNode.getY() && fromNodeY2<toNodeY2){					
	    	    diffY =(fromNodeY2 - toNode.getY())/2;
	    		  diffY = toNode.getY() + diffY;								
	    		}
	    		else if (fromNode.getY()>toNode.getY() && fromNodeY2<toNodeY2){					
	    		  diffY =(fromNode.getHeight())/2;
	    		  diffY = fromNode.getY() + diffY;															
	    		}				
	  	  }
	  	  switch (drawDirection ){
	  	    case "RIGHT_BOTTOM":
	  		  this.x1 = fromNode.getX()+diffX;
	  		  this.y1 = fromNode.getY();
	  		  this.x2 = toNodeX2;
	  		  this.y2 = toNodeY2-diffY;				
	  		break;
	  		case "RIGHT_TOP":
	  		  this.x1 = fromNode.getX();
	  		  this.y1 = fromNodeY2-diffY;
	  		  this.x2 = toNodeX2-diffX;
	  		  this.y2 = toNode.getY();				
	  		break;
	  		case "LEFT_BOTTOM":
	  		  this.x1 = fromNodeX2-diffX;
	  		  this.y1 = fromNode.getY() ;
	  		  this.x2 = toNode.getX();
	  		  this.y2 = toNodeY2-diffY;				
	  		break;					
	  		case "LEFT_TOP":
	  		  this.x1 = fromNodeX2;
	  		  this.y1 = fromNodeY2-diffY;
	  		  this.x2 = toNode.getX()+diffX;
	  		  this.y2 = toNode.getY();				
	  		break;					
	  		case "RIGHT":
	  		  this.x1 = fromNode.getX();
	  		  this.y1 = diffY;
	  		  this.x2 = toNodeX2;
	  		  this.y2 = diffY;			
	  		break;
	  		case "TOP":
	  		  this.x1 = diffX;
	  		  this.y1 = fromNodeY2;
	  		  this.x2 = diffX;
	  		  this.y2 = toNode.getY();				
	  		break;
	  		case "BOTTOM":
	  		  this.x1= diffX;
	  		  this.y1= fromNode.getY();
	  		  this.x2= diffX;
	  		  this.y2= toNodeY2;				
	  		break;
	  		case "LEFT":
	  		  this.x1= fromNodeX2;
	  		  this.y1= diffY;
	  		  this.x2= toNode.getX();
	  		  this.y2= diffY;	
	  		break;
	  	  }
	  	}
		/**
		* Get arrow drawing direction.
		*/
		public function getDrawDirection():String
		{
	  	  var drawDirection :String;
	  	  var fromNodeX2:int = fromNode.getX()+fromNode.getWidth();
	  	  var fromNodeY2:int = fromNode.getY()+fromNode.getHeight();
	  	  var toNodeX2:int = toNode.getX()+toNode.getWidth();
	  	  var toNodeY2:int = toNode.getY()+toNode.getHeight();
	  		
	  	  if (fromNode.getX()>toNodeX2 && fromNodeY2<toNode.getY()){
	  		  drawDirection = "RIGHT_TOP";
	  	  }
	  	  else if (fromNode.getX()>toNodeX2 && fromNode.getY()>toNodeY2){
	  	    drawDirection  = "RIGHT_BOTTOM";
	  	  }
	  	  else if (fromNodeX2<toNode.getX() && fromNode.getY()>toNodeY2){
	  	    drawDirection  = "LEFT_BOTTOM";
	  	  }
	  	  else if (fromNodeX2<toNode.getX() && fromNodeY2<toNode.getY()){
	  	    drawDirection  = "LEFT_TOP";
	  	  }
	  	  else if (fromNode.getX()>toNodeX2){
	  	    drawDirection  = "RIGHT";
	  	  }
	  	  else if (fromNodeY2<toNode.getY()){
	  	    drawDirection  = "TOP";
	  	  }
	  	  else if (fromNode.getY()>toNodeY2){
	  	    drawDirection  = "BOTTOM";
	  	  }
	  	  else if (fromNodeX2<toNode.getX()){
	  	    drawDirection  = "LEFT";
	  	  }
	  	  return drawDirection;
	  	}
  
	
		
	



    //	supporting function definitions for properties, events, styles, effects
/**
 * @private
 **/
public function ___UIComponent1_creationComplete(event:mx.events.FlexEvent):void
{
	init()
}


	//	binding mgmt





    /**
     * @private
     **/
    public var _bindingsByDestination : Object;
    /**
     * @private
     **/
    public var _bindingsBeginWithWord : Object;

}

}
