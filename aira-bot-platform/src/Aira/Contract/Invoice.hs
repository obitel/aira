{-# LANGUAGE QuasiQuotes #-}
-- |
-- Module      :  Aira.Contract.Invoice
-- Copyright   :  Alexander Krupenkin 2016
-- License     :  BSD3
--
-- Maintainer  :  mail@akru.me
-- Stability   :  experimental
-- Portability :  portable
--
-- Invoice contract API.
--
module Aira.Contract.Invoice where

import Network.Ethereum.Web3.TH
import Network.Ethereum.Web3

[abiFrom|abi/invoice.json|]
