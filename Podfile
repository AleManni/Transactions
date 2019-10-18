platform :ios, '9.0'
inhibit_all_warnings!

def shared_pods
pod 'ReachabilitySwift'
pod 'RealmSwift'

end
abstract_target 'BudTransactionsCommonPods' do
    use_frameworks!
shared_pods
target 'BudTransactions' 
target 'BudTransactionsTests'
target 'BudTransactionsUITests'
end
