package communicate
{
	/**
	 *  通信数据包
	 *  @author JiaWei
	 */	
	public class Packet
	{
		static public const NEED_ENCRYPT:Boolean = false;//是否对数据buff加密
		
		static public const DEFAULT_TAG:uint    = 0x10ffccdd;//约定的信息头
		static public const DEF_PACKET_CRC:uint = 0xffccddee;//默认CRC
		
		static public const DEFAULT_HEADER_CHECK_KEY:int = 0x7C58;//默认包头校验
		static public const HEADER_BLOCK_SIZE: int = 20;//16;//最小通信封包字节长度，也就是消息头编码后的字节长度
		
		public var tag:int;//信息头,2字节
		public var len:int;//buff长度,2字节
		public var dataCK:int;//buff校验,2字节
		public var headerCK:int;//包头校验,2字节
		public var buff:Object;//数据,len字节
		
		public function Packet()
		{
		}
	}
}