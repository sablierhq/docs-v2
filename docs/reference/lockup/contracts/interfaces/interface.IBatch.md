# IBatch

[Git Source](https://github.com/sablier-labs/lockup/blob/076eba971fea7bb38fe75ee5108f0589c26152c0/src/interfaces/IBatch.sol)

This contract implements logic to batch call any function.

## Functions

### batch

Allows batched calls to self, i.e., `this` contract.

_Since `msg.value` can be reused across calls, be VERY CAREFUL when using it. Refer to
https://paradigm.xyz/2021/08/two-rights-might-make-a-wrong for more information._

```solidity
function batch(bytes[] calldata calls) external payable returns (bytes[] memory results);
```

**Parameters**

| Name    | Type      | Description                       |
| ------- | --------- | --------------------------------- |
| `calls` | `bytes[]` | An array of inputs for each call. |

**Returns**

| Name      | Type      | Description                                                                      |
| --------- | --------- | -------------------------------------------------------------------------------- |
| `results` | `bytes[]` | An array of results from each call. Empty when the calls do not return anything. |