# ISablierBatchLockup

[Git Source](https://github.com/sablier-labs/lockup/blob/076eba971fea7bb38fe75ee5108f0589c26152c0/src/interfaces/ISablierBatchLockup.sol)

Helper to batch create Lockup streams.

## Functions

### createWithDurationsLD

Creates a batch of Lockup Dynamic streams using `createWithDurationsLD`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithDurationsLD} must be met for each stream.

```solidity
function createWithDurationsLD(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithDurationsLD[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                  | Description                                                                                                  |
| -------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `lockup` | `ISablierLockup`                      | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.     |
| `token`  | `IERC20`                              | The contract address of the ERC-20 token to be distributed.                                                  |
| `batch`  | `BatchLockup.CreateWithDurationsLD[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithDurationsLD}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |

### createWithTimestampsLD

Creates a batch of Lockup Dynamic streams using `createWithTimestampsLD`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithTimestampsLD} must be met for each stream.

```solidity
function createWithTimestampsLD(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithTimestampsLD[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                   | Description                                                                                                   |
| -------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `lockup` | `ISablierLockup`                       | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.      |
| `token`  | `IERC20`                               | The contract address of the ERC-20 token to be distributed.                                                   |
| `batch`  | `BatchLockup.CreateWithTimestampsLD[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithTimestampsLD}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |

### createWithDurationsLL

Creates a batch of Lockup Linear streams using `createWithDurationsLL`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithDurationsLL} must be met for each stream.

```solidity
function createWithDurationsLL(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithDurationsLL[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                  | Description                                                                                                  |
| -------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `lockup` | `ISablierLockup`                      | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.     |
| `token`  | `IERC20`                              | The contract address of the ERC-20 token to be distributed.                                                  |
| `batch`  | `BatchLockup.CreateWithDurationsLL[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithDurationsLL}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |

### createWithTimestampsLL

Creates a batch of Lockup Linear streams using `createWithTimestampsLL`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithTimestampsLL} must be met for each stream.

```solidity
function createWithTimestampsLL(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithTimestampsLL[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                   | Description                                                                                                   |
| -------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `lockup` | `ISablierLockup`                       | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.      |
| `token`  | `IERC20`                               | The contract address of the ERC-20 token to be distributed.                                                   |
| `batch`  | `BatchLockup.CreateWithTimestampsLL[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithTimestampsLL}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |

### createWithDurationsLT

Creates a batch of Lockup Tranched streams using `createWithDurationsLT`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithDurationsLT} must be met for each stream.

```solidity
function createWithDurationsLT(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithDurationsLT[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                  | Description                                                                                                  |
| -------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `lockup` | `ISablierLockup`                      | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.     |
| `token`  | `IERC20`                              | The contract address of the ERC-20 token to be distributed.                                                  |
| `batch`  | `BatchLockup.CreateWithDurationsLT[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithDurationsLT}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |

### createWithTimestampsLT

Creates a batch of Lockup Tranched streams using `createWithTimestampsLT`.

Requirements:

- There must be at least one element in `batch`.
- All requirements from {ISablierLockup.createWithTimestampsLT} must be met for each stream.

```solidity
function createWithTimestampsLT(
    ISablierLockup lockup,
    IERC20 token,
    BatchLockup.CreateWithTimestampsLT[] calldata batch
)
    external
    returns (uint256[] memory streamIds);
```

**Parameters**

| Name     | Type                                   | Description                                                                                                   |
| -------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `lockup` | `ISablierLockup`                       | The address of the [SablierLockup](/docs/reference/lockup/contracts/contract.SablierLockup.md) contract.      |
| `token`  | `IERC20`                               | The contract address of the ERC-20 token to be distributed.                                                   |
| `batch`  | `BatchLockup.CreateWithTimestampsLT[]` | An array of structs, each encapsulating a subset of the parameters of {SablierLockup.createWithTimestampsLT}. |

**Returns**

| Name        | Type        | Description                           |
| ----------- | ----------- | ------------------------------------- |
| `streamIds` | `uint256[]` | The ids of the newly created streams. |