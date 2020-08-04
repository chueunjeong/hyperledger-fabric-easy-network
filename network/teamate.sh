# 1. 체인코드 설치(chaincode install)
docker exec cli peer chaincode install -n teamate -v 1.0 -p github.com/rating
# 2. 체인코드 배포(chaincode instantiate)
docker exec cli peer chaincode instantiate -n teamate -v 1.0 -C mychannel -c '{"Args":[]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
sleep 3



#chaincode invoke addUser admin
docker exec cli peer chaincode invoke -n teamate -C mychannel -c '{"Args":["addUser","chuu"]}'
sleep 3

#chaincode query readRating admin
docker exec cli peer chaincode invoke -n teamate -C mychannel -c '{"Args":["addRating","chuu","math","5.0"]}'
sleep 3

#chaincode query readRating admin
docker exec cli peer chaincode query -n teamate -C mychannel -c '{"Args":["readRating","chuu"]}'
sleep 3



# 1. 체인코드 설치(chaincode install)
# docker exec cli peer chaincode install -n sacc -v 1.1 -p github.com/sacc
# sleep 3
# 2-1. 체인코드 재배포(chaincode upgrade)

# docker exec cli peer chaincode upgrade -n saccR -v 1.1 -C mychannel -c '{"Args":["a","100"]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
# sleep 3

