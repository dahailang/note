##网站CA证书
cat > ca-config.json << EOF
{
	"signing":{
		"defaule":{
			"expiry":"87699h"
		},
		"profiles":{ 
			"kubernetes":{
				"expiry":"87699h",
				"usages":[
					"signing",
					"key encipherment",
					"server auth",
					"client auth"
				]
			}
		}
	}
}
EOF

cat > ca-csr.json << EOF
{
    "CN": "kubernetes",
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [
        {
            "C": "CN",
            "L": "Beijing",
            "ST": "Beijing",
	    "O": "k8s",
	    "OU": "System"
        }
    ]
}
EOF

cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

##网站服务端证书
cat > server-csr.json << EOF
{
    "CN": "kubernetes",
    "hosts": [
        "127.0.0.1",
        "172.16.137.103",
        "172.16.137.102",
        "172.16.137.101",	
        "kubernetes",
        "kubernetes.default",
        "kubernetes.default.svc",
        "kubernetes.default.cluster",
        "kubernetes.default.cluster.local"
    ],
    "key": {
        "algo": "ecdsa",
        "size": 256
    },
    "names": [
        {
            "C": "CN",
            "L": "Beijing",
            "ST": "Beijing",
            "O": "k8s",
            "OU": "System"
        }
    ]
}
EOF

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes server-csr.json | cfssljson -bare server
##集群管理员通过证书访问集群
cat > admin-csr.json << EOF
{
    "CN": "admin",
    "hosts": [],
    "key": {
        "algo": "ecdsa",
        "size": 256
    },
    "names": [
        {
            "C": "CN",
            "L": "Beijing",
            "ST": "Beijing",
            "O": "k8s",
            "OU": "System"
        }
    ]
}
EOF
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes admin-csr.json | cfssljson -bare admin

##工作节点访问API生成网络策略
cat > kube-proxy-csr.json << EOF
{
    "CN": "system:kube-proxy",
    "hosts": [],
    "key": {
        "algo": "ecdsa",
        "size": 256
    },
    "names": [
        {
            "C": "CN",
            "L": "Beijing",
            "ST": "Beijing",
            "O": "k8s",
            "OU": "System"
        }
    ]
}
EOF

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes kube-proxy-csr.json | cfssljson -bare kube-proxy
