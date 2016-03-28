package com
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 *
	 *  @author JiaWei
	 */	
	public class GlobalEvent extends Event
	{
		static public const SOCKET_CONTENT_FINISH:String = "socket_content_finish";
		static public const SOCKET_DISCONNENT:String = "socket_disconnent";
		
		public var data:Object;
		public var value:Object;
		
		public function GlobalEvent(type:String, param:Object=null,other:Object = null)
		{
			super(type);
			data = param;
			value= other;
		}
		
		/**
		 *全局事件派发 
		 */		
		static private var dispatcher:EventDispatcher = new EventDispatcher();
		static public function dispatchEvent(evt:Event):void
		{
			dispatcher.dispatchEvent(evt);
		}
		static public function dispatchEventType(type:String,data:Object,value:Object=null):void
		{
			dispatcher.dispatchEvent(new GlobalEvent(type,data,value));
		}
		
		/**
		 *全局事件侦听 
		 * @param type
		 * @param func
		 * 
		 */		
		static public function addEventListener(type:String,func:Function):void
		{
			dispatcher.addEventListener(type,func);
		}
		static public function removeEventListener(type:String,func:Function):void
		{
			dispatcher.removeEventListener(type,func);
		}
		
	}
}