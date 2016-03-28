package unils
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/**
	 *  自定义的字节数组类
	 *  默认设置字节序为Endian.LITTLE_ENDIAN
	 *  @author JiaWei
	 */	
	public class CustomByteArray extends ByteArray
	{
		static public var charSet:String = "utf-8";//游戏通信中的字符串编码
		static public var dataEndia: String = Endian.LITTLE_ENDIAN;//游戏通信中的字节序
		
		static public const DT_VOID:int = 0;
		static public const DT_SMALL:int = 1;
		static public const DT_USMALL:int = 2;
		static public const DT_SHORT:int = 3;
		static public const DT_USHORT:int = 4;
		static public const DT_INT:int = 5;
		static public const DT_UINT:int = 6;
		static public const DT_FLOAT:int = 7;
		
		public function CustomByteArray()
		{
			super();
			this.endian = dataEndia;
		}

		/**
		 * 读取自定义的UTF-8字节序列
		 * 字符串数据前面有两字节是该字符串数据的长度,字符串后面还带一个0结尾
		 * @return 返回一个字符串
		 * 
		 */		
		public function readCustomBytes():String
		{
			var str:String = readUTF();
			position++;
			return str;
		}
		/**
		 * 读取自定义的数值
		 * @return 
		 * 
		 */		
		public function readNumeric(type:int):*
		{
			switch(type)
			{
				case DT_SMALL:
					return readByte();
				case DT_USMALL:
					return readUnsignedByte();
				case DT_SHORT:
					return readShort();
				case DT_USHORT:
					return readUnsignedShort();
				case DT_INT:
					return readInt();
				case DT_UINT:
					return readUnsignedInt();
				case DT_FLOAT:
					return readFloat();
				default: return 0;
			}
		}
		/**
		 * 将自定义的UTF-8字符串写入字节流
		 * @param value 要写入的字符串
		 * @return 
		 * 
		 */		
		public function writeCustomBytes(value:String):void
		{
			writeUTF(value);
			writeByte(0);
		}
		/**
		 * 写入两个一字节的消息号
		 * @param id 子系统ID
		 * @param subId 该子系统的具体消息号
		 * 
		 */		
		public function writeCmd(id:uint, subId:uint):void
		{
			writeByte(id);
			writeByte(subId);
		}
	}
}