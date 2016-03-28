package communicate
{
	/**
	 *  Socket状态
	 *  @author JiaWei
	 */	
	public class SocketStatus
	{
		static public const INIT:int = 0;//初始状态
		static public const CONNECTING:int = 1;//连接状态
		static public const CHECKING:int = 2;//校验状态,客户端发送握手包
		static public const COMMUNICATION:int = 3;//正常通信状态
		static public const DISCONNECT:int = 4;//断开连接
		
		public function SocketStatus()
		{
		}
	}
}