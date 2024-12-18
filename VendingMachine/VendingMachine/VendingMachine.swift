//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by lyj on 12/16/24.
//

import Foundation

enum VendingMachineError: Error{
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock(currentItemCount: Int)
}

class VendingMachine {
    private var deposit: Int = 0
    private var _itemCount: Int = 10
    private let _itemPrice: Int = 500
    
    var itemCount: Int{
        return _itemCount
    }
    var itemPrice: Int{
        return _itemPrice
    }
    
    //돈 받기 메서드
    func receiveMoney(_ money: Int) -> String{
        deposit += money
        print("총 투입금액: \(deposit)")
        return String(deposit)
    }
    
    //물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        let change = deposit - (numberOfItemsToVend * itemPrice)
        guard change >= 0 else{
            throw VendingMachineError.insufficientFunds(moneyNeeded: -change )
        }
        guard numberOfItemsToVend <= itemCount else{
            throw VendingMachineError.outOfStock(currentItemCount: itemCount)
        }
        
        //자판기 정보 업데이트
        deposit = 0
        _itemCount -= numberOfItemsToVend
        
        
        print("주문 수량: \(numberOfItemsToVend), 잔돈: \(change)")
        return "주문 수량: \(numberOfItemsToVend), 잔돈: \(change)"
    }
}
