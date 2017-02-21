//sol Registrar
// Simple global registrar.
// @authors:
//   Gav Wood <g@ethdev.com>

pragma solidity ^0.4.2;

contract Registrar {
	event Changed(string indexed name);

	function addr(string _name) constant returns (address o_address);
	function subRegistrar(string _name) constant returns (address o_subRegistrar);
	function content(string _name) constant returns (bytes32 o_content);
}
