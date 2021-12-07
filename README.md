Mining centralization is a problem for Bitcoin, Litecoin and most other 
crypto-currencies. Increasingly, more and more transactions are mined by a 
handful of big players with expensive, specialized hardware. When most 
transaction processing is handled by a wealthy, small group, then this 
threatens the crypto-currency's independence and the numerous benefits that 
come from decentralization. To support the largest, most vibrant mining 
community, Heavycoin introduces a novel ASIC-resistant cryptographic hash 
function called HEFTY1. Initially this opened the door for thousands of 
CPU-only miners to become early stakeholders. Currently HEFTY1 offers GPU 
miners lean power consumption and low heat generation, which is great news 
for keeping electricity costs low and profits high.
### Features
Early experiences in GPU mining Heavycoin indicate that there are currently 
some unique advantages, including [lower power 
consumption](https://bitcointalk.org/index.php?topic=167229.msg5721823#msg5721823) 
and [cooler 
operation](https://bitcointalk.org/index.php?topic=506774.msg5746513#msg5746513). 
It is thought that this is due to HEFTY1 creating stalls in the GPU 
implementations. Whether this is a permanent feature or just a temporary 
advantage due to unoptimized GPU implementations is unknown at this stage. 
- ASIC-resistant - Tiny memory footprint - Power efficient GPU mining - Low 
temperature GPU mining
### Security
HEFTY1 is new and its security is not proven. Therefore, we deploy it in a 
safe way that is provably at least as secure as the 4 main cryptographic 
hash functions that protect Heavycoin. We use HEFTY1 as a secondary hash of 
the input, while the original input is still hashed by SHA-256, Keccak-512, 
Grøestl-512 and BLAKE-512. Specifically, for each secure cryptographic hash 
function ![H](https://heavycoin.github.io/images/h-variable.png) in 
(SHA-256, Keccak-512, Grøestl-512 and BLAKE-512), we use the following 
collision avoiding construction.
![Heavycoin(x) = H(x + 
!HEFTY1(x))ROESTL(SKEIN(BLAKE(x))))](https://heavycoin.github.io/images/heavycoin-hash.png 
!"We guarantee that the Heavycoin hash is always at least as good as 
!SHA256, KECCAK, GROESTL and BLAKE")
where is the concatenation operation. This means that even if HEFTY1 has 
collisions, the input to 
![H](https://heavycoin.github.io/images/h-variable.png) still contains the 
original input and, therefore, will not collide.
In this way HEFTY1 is only used for thwarting GPU miners, while the block chain is secured through the use of the 4 well-known cryptographic hash functions. In a highly unlikely worst case scenario where HEFTY1 is broken, then GPU-miners could obtain a speed advantage only. The block chain would still be secured through SHA-256, Keccak-512, Grøestl-512 and BLAKE-512.
