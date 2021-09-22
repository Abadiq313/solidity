contract C {
	function testFunction() external {}

	function testYul() public returns (uint32) {
		function() external fp = this.testFunction;
		uint selectorValue = 0;

		assembly {
			selectorValue := fp.selector
		}

		return uint32(bytes4(bytes32(selectorValue)));
	}
	function testSol() public returns (uint32) {
		return uint32(this.testFunction.selector);
	}
}
// ====
// compileViaYul: also
// ----
// testYul() -> 0xe16b4a9b
// testSol() -> 0xe16b4a9b
