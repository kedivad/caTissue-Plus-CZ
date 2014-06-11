/**
 * 	Generated by mxmlc 2.0
 *
 *	Package:	Components
 *	Class: 		CustomFormulaNode
 *	Source: 	C:\GitHub\caTissue_Plus_CZ\flexclient\dag\Components\CustomFormulaNode.mxml
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
import flash.events.MouseEvent;
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
import mx.containers.Box;
import mx.containers.HBox;
import mx.containers.VBox;
import mx.controls.Button;
import mx.controls.Label;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.UIComponentDescriptor;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.styles.*;



public class CustomFormulaNode
	extends mx.containers.Box
	implements flash.utils.IExternalizable
{

	[Bindable]
/**
 * @private
 **/
	public var dNodeFormula : mx.containers.HBox;

	[Bindable]
/**
 * @private
 **/
	public var formulaLabel : mx.controls.Label;




private var _documentDescriptor_ : mx.core.UIComponentDescriptor = 
new mx.core.UIComponentDescriptor({
  type: mx.containers.Box
  ,
  propertiesFactory: function():Object { return {
    width: 330,
    height: 88,
    childDescriptors: [
      new mx.core.UIComponentDescriptor({
        type: mx.containers.HBox
        ,
        id: "dNodeFormula"
        ,
        events: {
          creationComplete: "__dNodeFormula_creationComplete"
        }
        ,
        stylesFactory: function():void {
          this.textAlign = "center";
          this.horizontalGap = 0;
          this.backgroundColor = 16777215;
        }
        ,
        propertiesFactory: function():Object { return {
          percentHeight: 100.0,
          percentWidth: 100.0,
          childDescriptors: [
            new mx.core.UIComponentDescriptor({
              type: mx.controls.Label
              ,
              id: "formulaLabel"
              ,
              propertiesFactory: function():Object { return {
                percentHeight: 100.0,
                percentWidth: 95.0
              }}
            })
          ,
            new mx.core.UIComponentDescriptor({
              type: mx.containers.VBox
              ,
              stylesFactory: function():void {
                this.verticalAlign = "middle";
              }
              ,
              propertiesFactory: function():Object { return {
                percentHeight: 100.0,
                childDescriptors: [
                  new mx.core.UIComponentDescriptor({
                    type: mx.controls.Button
                    ,
                    events: {
                      click: "___Button1_click"
                    }
                    ,
                    propertiesFactory: function():Object { return {
                      label: ">",
                      percentWidth: 5.0
                    }}
                  })
                ]
              }}
            })
          ]
        }}
      })
    ]
  }}
})

    /**
     * @private
     **/
	public function CustomFormulaNode()
	{
		super();

		mx_internal::_document = this;

		//	our style settings
		//	initialize component styles
		if (!this.styleDeclaration)
		{
			this.styleDeclaration = new CSSStyleDeclaration();
		}

		this.styleDeclaration.defaultFactory = function():void
		{
			this.borderThickness = 2;
			this.color = 0;
			this.backgroundColor = 16777215;
			this.borderColor = 255;
			this.borderStyle = "solid";
		};



		//	properties
		this.width = 330;
		this.height = 88;

		//	events

	}

    /**
     * @private
     **/
	override public function initialize():void
	{
 		mx_internal::setDocumentDescriptor(_documentDescriptor_);

		//	binding mgmt
		_CustomFormulaNode_bindingsSetup();

		var target:CustomFormulaNode = this;

		if (_watcherSetupUtil == null)
		{
			var watcherSetupUtilClass:Object = getDefinitionByName("_Components_CustomFormulaNodeWatcherSetupUtil");
			watcherSetupUtilClass["init"](null);
		}

		_watcherSetupUtil.setup(this,
					function(propertyName:String):* { return target[propertyName]; },
					_bindings,
					_watchers);


		super.initialize();
	}


        import mx.controls.Menu;
        import mx.events.MenuEvent;
        import mx.controls.Alert;
        import Components.DAGConstants;
        import mx.rpc.events.ResultEvent;
        import mx.rpc.events.FaultEvent; 
  		[Bindable]
  		public var customFormula : String = null;
  		
  		[Bindable]
  		public var currentCustomNode : CustomFormulaNode = null;
  		
  		[Bindable]
		public var myMenuData:Array = [	
		    {label: "Odstranit", type: "radio", toggled: false,enabled:true},
		    {label: "Upravit", type: "radio", toggled: false,enabled:true}
		];
		
		[Bindable]
		public var outputMenuData:Array = [	
			{label: "Upravit", type: "radio", toggled: false,enabled:false},
			{label: "Odstranit", type: "radio", toggled: false,enable:true}
		];


//
        private var firstNodeName : String = "";
        private var secondNodeName : String = "";
          
        private var firstNodeExpId : int = 0;
        private var secondNodeExpId : int = 0;
        
        private var firstSelectedAttrName : String = "";
        private var secondSelectedAttrName : String = ""; 

        private var firstSelectedAttrId : String = "";
        private var secondSelectedAttrId : String = "";
        
        private var firstSelectedAttrType : String = "";
        private var secondSelectedAttrType : String = "";
        
        private var selectedArithmeticOp : String = "";
        
        private var selectedLogicalOp : String = "";

        private var timeValue : String = null;
        private var timeInterval : String = null; 
        
        private var operation : String = null;
        private var customColumnName : String = "";
        
        private var qAttrInterval1: String = "";
        private var qAttrInterval2: String = "";
        
        
        public function setQAttrInterval1(qAttrInterval1 : String) : void
        {
        	this.qAttrInterval1 = qAttrInterval1;
        }
        
        public function getQAttrInterval1 () : String
        {
        	return this.qAttrInterval1;
        }
        
        public function setQAttrInterval2(qAttrInterval2 : String) : void
        {
        	this.qAttrInterval2 = qAttrInterval2;
        }
        
        public function getQAttrInterval2 () : String
        {
        	return this.qAttrInterval2;
        }
                
        public function setCustomColumnName(customColumnName : String) : void
        {
        	this.customColumnName = customColumnName;
        }
        
        public function getCustomColumnName () : String
        {
        	return this.customColumnName;
        }
        public function setOperation(operation : String) : void
        {
         	this.operation = operation;
        }
        
        public function getOperation() : String
        {
            return this.operation;	
        } 
		
  		public function initializeNode(x:int,y:int,name :String) : void
  		{
  			this.x = x;
  			this.y = y;
  			this.name = name; 
  		}
  		
  		public function setFirstNodeName(firstNodeName : String) : void
  		{
  			this.firstNodeName = firstNodeName;
  		}
  		
  		public function getFirstNodeName() : String
  		{
  			return this.firstNodeName;
  		}
  		
  		public function setSecondNodeName(secondNodeName : String) : void
  		{
  		   	this.secondNodeName = secondNodeName;
  		}
  		public function getSecondNodeName() : String
  		{
  		    return this.secondNodeName;
  		}
  		
  		
  		public function setFirstNodeExpId(firstNodeExpId : int) : void
  		{
  			this.firstNodeExpId = firstNodeExpId;
  		}
  		
  		public function getFirstNodeExpId() : int
  		{
  			return this.firstNodeExpId;
  		}
  		
  		public function setSecondNodeExpId(secondNodeExpId : int) : void
  		{
  		    	this.secondNodeExpId = secondNodeExpId;
  		}
  		public function getSecondNodeExpId() : int
  		{
  			return this.secondNodeExpId;
  		}
  		
  		
  		public function setFirstSelectedAttrName(firstSelectedAttrName : String) : void
  		{
  			this.firstSelectedAttrName = firstSelectedAttrName;
  		}
  		
  		public function getFirstSelectedAttrName() : String
  		{
  			return this.firstSelectedAttrName;
  		}
  		
  		public function setSecondSelectedAttrName(secondSelectedAttrName : String) : void
  		{
  			this.secondSelectedAttrName = secondSelectedAttrName;
  		} 
  		 
  		public function getSecondSelectedAttrName() : String
  		{
  		 	return this.secondSelectedAttrName;
  		}
  		 	
  		public function setFirstSelectedAttrId(firstSelectedAttrId : String) : void
  		{
  			this.firstSelectedAttrId = firstSelectedAttrId;
  		}
  			
  		public function getFirstSelectedAttrId() : String	
  		{
  		    return this.firstSelectedAttrId;	
  		}
  		
  		
  		public function setSecondSelectedAttrId(secondSelectedAttrId : String) : void
  		{
  		     this.secondSelectedAttrId = secondSelectedAttrId; 	
  		}
  		public function getSecondSelectedAttrId() : String
  		{
  			return this.secondSelectedAttrId;
  		}
  		
  		public function setFirstSelectedAttrType(firstSelectedAttrType : String) : void
  		{
  			this.firstSelectedAttrType =  firstSelectedAttrType;
  		}
  		public function getFirstSelectedAttrType() : String
  		{
  			return this.firstSelectedAttrType;
  		}
  		
  		
  		public function setSecondSelectedAttrType(secondSelectedAttrType : String) : void
  		{
  			this.secondSelectedAttrType  = secondSelectedAttrType;
  		} 
  		public function getSecondSelectedAttrType() : String
  		{
  			return this.secondSelectedAttrType;
  		}
  		
  		
  		public function setSelectedArithmeticOp(selectedArithmeticOp : String) : void
  		{
  			this.selectedArithmeticOp = selectedArithmeticOp;
  		}
  		
  		public function getSelectedArithmeticOp() : String
  		{
  			return this.selectedArithmeticOp;
  		} 
  		
  		public function setSelectedLogicalOp(selectedLogicalOp : String) : void
  		{
  			this.selectedLogicalOp = selectedLogicalOp;
  		} 
  		public function getSelectedLogicalOp() : String
  		{
  			return this.selectedLogicalOp;
  		}
  		
  		public function setTimeValue(timeValue : String) : void
  		{
  			this.timeValue = timeValue;
  		}
  		public function getTimeValue() : String
  		{
  			return this.timeValue;
  		}
  		
  		public function setTimeInterval(timeInterval : String) : void
  		{
  			this.timeInterval = timeInterval;
  		}
  		public function getTimeInterval() : String
  		{
  			return this.timeInterval;
  		}
  		
  		/**
		* Read serialized data
		*/
		public function readExternal(input:IDataInput):void 
		{
			 this.name = input.readUTF();
			 firstNodeName = input.readUTF();
			 secondNodeName = input.readUTF();
			 firstNodeExpId = input.readInt();
			 secondNodeExpId = input.readInt();
			 
			 firstSelectedAttrName = input.readUTF();
			 secondSelectedAttrName = input.readUTF();
			 
			 firstSelectedAttrId = input.readUTF();
			 secondSelectedAttrId = input.readUTF();
			 
			 firstSelectedAttrType = input.readUTF();
			 secondSelectedAttrType = input.readUTF();
			 
			 selectedArithmeticOp = input.readUTF();
			 
			 selectedLogicalOp = input.readUTF();
			 
			 timeValue = input.readUTF();
			 
			 timeInterval = input.readUTF();
			 operation = input.readUTF();
			 customColumnName = input.readUTF();
			 this.x = input.readInt();
			 this.y = input.readInt();
			 
			 qAttrInterval1 = input.readUTF();	
			 qAttrInterval2 = input.readUTF();
		}	

        
        /*
           Write Searialized Data
        */
        public function writeExternal(out:IDataOutput):void 
        {
        	out.writeUTF(this.name);
        	out.writeUTF(firstNodeName);
        	out.writeUTF(secondNodeName);
        	out.writeInt(firstNodeExpId);
        	out.writeInt(secondNodeExpId);
        	out.writeUTF(firstSelectedAttrName);
        	out.writeUTF(secondSelectedAttrName);
        	out.writeUTF(firstSelectedAttrId);
        	out.writeUTF(secondSelectedAttrId);
        	out.writeUTF(firstSelectedAttrType);
        	out.writeUTF(secondSelectedAttrType);
        	out.writeUTF(selectedArithmeticOp);
        	out.writeUTF(selectedLogicalOp);
        	out.writeUTF(timeValue);
        	out.writeUTF(timeInterval);
        	out.writeUTF(operation);
        	out.writeUTF(customColumnName);
        	out.writeInt(this.x);
        	out.writeInt(this.y);
        	out.writeUTF(qAttrInterval1);
        	out.writeUTF(qAttrInterval2);
        }    		
  		
  		
  		
  		private function createMyMenu(event:MouseEvent):void
  		{
  			var myNewMenu:Menu=null;
  			if(this.parentApplication.view=="Result")
  			{
  				//This is the case when view is Result, so menu shoud be different and editing should be disabled
  				myNewMenu = Menu.createMenu(this, outputMenuData, true);
  			}
  			else
  			{
  				myNewMenu = Menu.createMenu(this, myMenuData, true);
  			}	
  			
  			myNewMenu.show(event.stageX,event.stageY);
			myNewMenu.addEventListener(MenuEvent.ITEM_CLICK,handleMenuEvent);
			myNewMenu.addEventListener(FaultEvent.FAULT, faultHandler);
  	   }
  	   
  	   private function handleMenuEvent(event:MenuEvent):void
  	   { 	
  	   	  if(event.label == DAGConstants.DELETE)
  	   	  {
  	   	      //To delete the Custom Formula Node	
  	   	      deleteCustomNode();
  	   	  }
  	   	  else
  	   	  {
  	   	  	 editCustomFormula();
  	   	  }
  	   }
  	   private function deleteCustomNode() : void
  	   {
  	   	  var nodeName : String = this.name;
  	   	  this.parentApplication.rpcService.addEventListener(ResultEvent.RESULT,nodeRemoveHandler);
  	   	  this.parentApplication.rpcService.removeCustomFormula(nodeName);
          this.parentApplication.rpcService.addEventListener(FaultEvent.FAULT, faultHandler);
  	   }
  	   private function nodeRemoveHandler(event : ResultEvent) : void
  	   {
  	   	  var customNodeName : String = this.name; 
  	   	  
  	   	  //Deriving line object Names which attaches the DagNode and Custom formula node
          var nodesNumbers : Array = customNodeName.split("_");
          var line1 : String = nodesNumbers[0] + "_" + customNodeName;    	   	  
  	   	  var line2 : String = nodesNumbers[1] + "_" + customNodeName;
  	     
  	      //this.parentApplication.rpcService.addEventListener(ResultEvent.RESULT,nodeRemoveHandler);
  	      //Deleting the Custom Formula Node and corresponding connecting Nodes 
          this.parentApplication.deleteCustomNode(customNodeName,line1,line2);  	   
  	   }
  	   private function editCustomFormula() : void
  	   {
			var node : CustomFormulaNode = this;
			trace("Redefined custom formula :"+node);
			currentCustomNode = node;
			this.parentApplication.operationforView="edit"; //to get popwindow fields values 
			this.parentApplication.rpcService.retrieveEditQueryData(node);
			this.parentApplication.rpcService.removeEventListener(ResultEvent.RESULT,nodeRemoveHandler);
			this.parentApplication.rpcService.addEventListener(ResultEvent.RESULT,editNodeHandler);  
			this.parentApplication.rpcService.addEventListener(FaultEvent.FAULT, faultHandler);  
  	   }
  	  private function faultHandler (event:FaultEvent):void
	  {
		  Alert.show(event.fault.faultString, 'Error');
	  }
  	   
  	   private function editNodeHandler(event : ResultEvent) : void
  	   {
  	   	  this.parentApplication.rpcService.removeEventListener(ResultEvent.RESULT,editNodeHandler);
  	   	  this.parentApplication.createAndPopulate(event.result as Object, "edit", currentCustomNode);
  	   }
  	   private function changeBgColor() : void{
       	if((this.parentApplication.view=="Result") && ((this.parentApplication.operationforView == "create") || (this.parentApplication.operationforView == "rePaintCreate"))){
       		dNodeFormula.setStyle("backgroundColor","#e7ddfa");
       	}else{
       		dNodeFormula.setStyle("backgroundColor","#FFFFFF");
       	}       		
       }        
       
  	



    //	supporting function definitions for properties, events, styles, effects
/**
 * @private
 **/
public function __dNodeFormula_creationComplete(event:mx.events.FlexEvent):void
{
	changeBgColor()
}

/**
 * @private
 **/
public function ___Button1_click(event:flash.events.MouseEvent):void
{
	createMyMenu(event)
}


	//	binding mgmt
    private var _bindings:Array;
    private var _watchers:Array;
    private function _CustomFormulaNode_bindingsSetup():void
    {
        if (!_bindings)
        {
            _bindings = [];
        }

        if (!_watchers)
        {
            _watchers = [];
        }

        var binding:Binding;

        binding = new mx.binding.Binding(this,
            function():String
            {
                var result:* = (customFormula);
                var stringResult:String = (result == undefined ? null : String(result));
                return stringResult;
            },
            function(_sourceFunctionReturnValue:String):void
            {
				
                formulaLabel.text = _sourceFunctionReturnValue;
            },
            "formulaLabel.text");
        _bindings[0] = binding;
    }

    private function _CustomFormulaNode_bindingExprs():void
    {
        var destination:*;
		[Binding(id='0')]
		destination = (customFormula);
    }

    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil):void
    {
        (CustomFormulaNode)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil;





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
