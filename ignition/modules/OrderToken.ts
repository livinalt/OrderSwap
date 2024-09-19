import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const OrderSwapModule = buildModule("OrderSwapModule", (m) => {

  const tokenA_contractAddress = "0x07Cb88b1d6E06a5fd54Ae8d4A71713BF822f4389"; //  tokens A
  const tokenB_contractAddress = "0xB9B678B56D243e5d4a9Dff43458226c06557EA2b"; //  tokens B
  const tokenZ_contractAddress = "0x565BD1C5C443BC2F1C2aE6Fe06Ed0ee1ef08141D"; //  token Z

  const orderSwap = m.contract("OrderSwap", [tokenA_contractAddress, tokenB_contractAddress, tokenZ_contractAddress]);

  return { orderSwap };

});

export default OrderSwapModule;
