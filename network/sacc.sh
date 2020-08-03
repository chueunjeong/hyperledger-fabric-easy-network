# 1. 체인코드 설치(chaincode install)
docker exec cli peer chaincode install -n mysacc -v 1.0 -p github.com/mysacc
# 2. 체인코드 배포(chaincode instantiate)
docker exec cli peer chaincode instantiate -n mysacc -v 1.0 -C mychannel -c '{"Args":[]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
sleep 3


#chaincode invoke  a
docker exec cli peer chaincode invoke -n mysacc -C mychannel -c '{"Args":["set","a","100"]}'
sleep 3
#chaincode query a
docker exec cli peer chaincode query -n mysacc -C mychannel -c '{"Args":["get","a"]}'
sleep 3

#chaincode invoke b
docker exec cli peer chaincode invoke -n mysacc -C mychannel -c '{"Args":["set","b","200"]}'
sleep 3

#chaincode invoke c
docker exec cli peer chaincode invoke -n mysacc -C mychannel -c '{"Args":["set","c","300"]}'
sleep 3

#chaincode query allKeys(a,b,c)
docker exec cli peer chaincode query -n mysacc -C mychannel -c '{"Args":["getAllKeys"]}'
sleep 3

# 1. 체인코드 설치(chaincode install)
# docker exec cli peer chaincode install -n mysacc -v 1.1 -p github.com/mysacc
# sleep 3
# 2-1. 체인코드 재배포(chaincode upgrade)

# docker exec cli peer chaincode upgrade -n mysaccR -v 1.1 -C mychannel -c '{"Args":["a","100"]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
# sleep 3

