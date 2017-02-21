//sol OwnedRegistrar
// Global registrar with single authoritative owner.
// @authors:
//   Gav Wood <g@ethdev.com>

pragma solidity ^0.4.2;
import "common/Object.sol";
import "./Registrar.sol";

contract AiraRegistrarService is Registrar, Object {
	struct Record {
		address addr;
		address subRegistrar;
		bytes32 content;
	}
	
	function disown(string _name) onlyOwner {
		delete m_toRecord[_name];
		Changed(_name);
	}

	function setAddr(string _name, address _a) onlyOwner {
		m_toRecord[_name].addr = _a;
		Changed(_name);
	}
	function setSubRegistrar(string _name, address _registrar) onlyOwner {
		m_toRecord[_name].subRegistrar = _registrar;
		Changed(_name);
	}
	function setContent(string _name, bytes32 _content) onlyOwner {
		m_toRecord[_name].content = _content;
		Changed(_name);
	}
	function record(string _name) constant returns (address o_addr, address o_subRegistrar, bytes32 o_content) {
		o_addr = m_toRecord[_name].addr;
		o_subRegistrar = m_toRecord[_name].subRegistrar;
		o_content = m_toRecord[_name].content;
	}
	function addr(string _name) constant returns (address) { return m_toRecord[_name].addr; }
	function subRegistrar(string _name) constant returns (address) { return m_toRecord[_name].subRegistrar; }
	function content(string _name) constant returns (bytes32) { return m_toRecord[_name].content; }

	mapping (string => Record) m_toRecord;
}

