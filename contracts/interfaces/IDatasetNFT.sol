// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./IDistributionManager.sol";
import "./ISubscriptionManager.sol";
import "./IVerifierManager.sol";

/**
 * @title Interface of Datset NFT
 * @notice Defines function available for Dataset Admins and FragmentNFT contract
 */
interface IDatasetNFT is IERC721 {

    struct ManagersConfig {
        address subscriptionManager;
        address distributionManager;
        address verifierManager;
    }

    function mint(uint256 id, address to, bytes calldata signature) external;
    function setManagers(uint256 id, ManagersConfig calldata config) external;
    function deployFragmentInstance(uint256 id) external returns(address);

    function proposeFragment(uint256 datasetId, uint256 fragmentId, address to, bytes32 tag, bytes calldata signature) external;

    function subscriptionManager(uint256 id) external view returns(address);
    function verifierManager(uint256 id) external view returns(address);
    function distributionManager(uint256 id) external view returns(address);
    function fragmentNFT(uint256 id) external view returns(address);

    function isSigner(address account) external view returns(bool);
}