;; [K-571,SHA-1]
#|
  Msg = 37c99c912a0ba82801261e22bfcb75e4827f8c89
  d = 0a21e0bbe904738a47ae93d3798b8423ae87351d4705b461634a544bccea500c21d832e7ce62f024af2d9618b12abe323ab3bb8d966add118fb00df5fa80a992585a003e9b8526b
  Qx = 2bf77bc3d81c9e3aa0657c5051a2fe5091ff88186de4dc000ba4686317601971cdec69b2f336e9662ef73d94a618226a33cdd3154f361b40855d394b4fc3d77758b35e0efa221fe
  Qy = 170d498127641719f14e5197b17c84d929ab60aa8008889570ee42614d73c2ace4baed0e9c9a12145ded66a951eac1e50f690c563b5dccdc9dd8e89af76a979c126667ee085427c
  k = 047e74e6132b789f0c7429ce6b9d192308ed26b72fbf825f0052c3ca6afc7df4d7998b1293b0586238480e6cacf704ef4c7bdc38f9c44dff184202d51f9733d4d9d8a8f3a87ec1c
  R = 0276c3f6fe7f983d6b9a7ea8f598f1655b634dc1eadd7daf39ed2a13689c0b322068c7aeca96f6cff1149581b86cc7a272aece7fc297fca553209126f3c0c137af26d7e1d02ff1b
  S = 193b53275ffbc5f9ba3e9977c2f63598b3de7946b8e494e23f01067c9aa71899a1769df25b17aa8e1495d9c32221e5aea188272effcfac4bcd547354a4288a78a4c66623a6eac85
|#
(test-ecdsa NIST-K-571 no-20
            #x37c99c912a0ba82801261e22bfcb75e4827f8c89
            #x0a21e0bbe904738a47ae93d3798b8423ae87351d4705b461634a544bccea500c21d832e7ce62f024af2d9618b12abe323ab3bb8d966add118fb00df5fa80a992585a003e9b8526b
            #x2bf77bc3d81c9e3aa0657c5051a2fe5091ff88186de4dc000ba4686317601971cdec69b2f336e9662ef73d94a618226a33cdd3154f361b40855d394b4fc3d77758b35e0efa221fe
            #x170d498127641719f14e5197b17c84d929ab60aa8008889570ee42614d73c2ace4baed0e9c9a12145ded66a951eac1e50f690c563b5dccdc9dd8e89af76a979c126667ee085427c
            #x047e74e6132b789f0c7429ce6b9d192308ed26b72fbf825f0052c3ca6afc7df4d7998b1293b0586238480e6cacf704ef4c7bdc38f9c44dff184202d51f9733d4d9d8a8f3a87ec1c
            #x0276c3f6fe7f983d6b9a7ea8f598f1655b634dc1eadd7daf39ed2a13689c0b322068c7aeca96f6cff1149581b86cc7a272aece7fc297fca553209126f3c0c137af26d7e1d02ff1b
            #x193b53275ffbc5f9ba3e9977c2f63598b3de7946b8e494e23f01067c9aa71899a1769df25b17aa8e1495d9c32221e5aea188272effcfac4bcd547354a4288a78a4c66623a6eac85
)

;; [K-571,SHA-224]
#|
  Msg = e0f12d3d93f1129d738604e693fd100c2f05b86ef6086561f2dab573
  d = 19cf4f4d06825499949f9e0b442586fe1bfe3459813a2b92cd8de0f775a4735e02655702ead8e60824180761808d9e816d60bdb0238e1e8039ca7bb63c92e1cf8433ef447e64ead
  Qx = 07b9cb1728cba80367b62872a986e4fc7f90f269453634d9946f79b1fedf42ca67af93e97ee0601bb3166e85357e8b044e39dcc19e608eaaa8a0066ffc48aa480c0e1e8d5569cbf
  Qy = 580858ab9223c2b2ea58df506d703d64b387a78ef43846894e7a2e47c02252bd2c1e3d21ada7c21d50a08cef0f9a189c4e850c058cc57c37918251b5aaaff2321d7355b6b555644
  k = 0726d5e317f888dddc94c73acb14b320ff509908052868f8c6b14e531ca467c1f7c8287476674efd0d636ca94c24a69d15210bb43a368a11d3453d69ca80430cbfb8b6e45d8f21a
  R = 04ec6205bdd8f7eab414110ed620dd3fbbda4cb3ad9e5559a114ca9344782847621961a3577cbbe43d94eff6ffc8dd7dd09c049239f026a928301ffcddcc910bf196853edc86d31
  S = 16535b1af98a75b9bc0f122ca3ce23a01800fa33b43584a94fd8a8d6f40077eb739f07c9f0e179a157a28023735fc8da2e2ebbee5f7308925900e657fae7c3b321f14fc45346f89
|#
(test-ecdsa NIST-K-571 no-28
            #xe0f12d3d93f1129d738604e693fd100c2f05b86ef6086561f2dab573
            #x19cf4f4d06825499949f9e0b442586fe1bfe3459813a2b92cd8de0f775a4735e02655702ead8e60824180761808d9e816d60bdb0238e1e8039ca7bb63c92e1cf8433ef447e64ead
            #x07b9cb1728cba80367b62872a986e4fc7f90f269453634d9946f79b1fedf42ca67af93e97ee0601bb3166e85357e8b044e39dcc19e608eaaa8a0066ffc48aa480c0e1e8d5569cbf
            #x580858ab9223c2b2ea58df506d703d64b387a78ef43846894e7a2e47c02252bd2c1e3d21ada7c21d50a08cef0f9a189c4e850c058cc57c37918251b5aaaff2321d7355b6b555644
            #x0726d5e317f888dddc94c73acb14b320ff509908052868f8c6b14e531ca467c1f7c8287476674efd0d636ca94c24a69d15210bb43a368a11d3453d69ca80430cbfb8b6e45d8f21a
            #x04ec6205bdd8f7eab414110ed620dd3fbbda4cb3ad9e5559a114ca9344782847621961a3577cbbe43d94eff6ffc8dd7dd09c049239f026a928301ffcddcc910bf196853edc86d31
            #x16535b1af98a75b9bc0f122ca3ce23a01800fa33b43584a94fd8a8d6f40077eb739f07c9f0e179a157a28023735fc8da2e2ebbee5f7308925900e657fae7c3b321f14fc45346f89
)

;; [K-571,SHA-256]
#|
  Msg = eaf741036acde2e12b82a44bc6110be0ab84be0a882b6a03a3c3590f7e9e1842
  d = 04d873ac744c4f68bb044783ad69e1a733cb8b8f483f2695bbd90c4211282036ad7914a53b25c3e890c6824643cffbdc4138d7ff457e3fbb99387494eb5cf2bdf1ad243a3a1e644
  Qx = 4644456a4e5c543af7a086640fa9ff6627c2d9f17066d255c3e805db31fb1ba895682e94f6ab96d6ca449b0c3f76bfd6593d182f422689b31d9dc3bc0b70df210a96d19af9ec2ac
  Qy = 1d38f8572a06ce22c1586a8329f9421414b334352f1e8b961f7e0732ee01e838eb975bfb2f62132bbfd9acc6ef8899b4fd388c2b59e564fc3670da7a008ca016de678d6dded137c
  k = 0b050aa7266201a42dbee063ae2a21398ee1d2a190de9fbbce2468836e416b3ec18d7340c81fd2a5283713f9aba33e8cbb105eaa2abbf0b687fe2713921bcbc02a4b77df21f762f
  R = 08351115714bc8f29b84a6e3f0a23bdc219d4271a9ee18bdab54c3acc9cb3468beb1f89b0f981da5aa7d7ec7ad451bc5e91bc98440fe20f5877a4e73614820b9ab6f2bad3e2e609
  S = 0c64baaeed68178f5a1d8f095b0932fb73f9a02462df5e8378746ecf17d05971a0a287d5a8e0317db055b02d4f4b5864597d0f9a9cb1ae68577dcaf7db09c55bf3d3575197295c9
|#
(test-ecdsa NIST-K-571 no-32
            #xeaf741036acde2e12b82a44bc6110be0ab84be0a882b6a03a3c3590f7e9e1842
            #x04d873ac744c4f68bb044783ad69e1a733cb8b8f483f2695bbd90c4211282036ad7914a53b25c3e890c6824643cffbdc4138d7ff457e3fbb99387494eb5cf2bdf1ad243a3a1e644
            #x4644456a4e5c543af7a086640fa9ff6627c2d9f17066d255c3e805db31fb1ba895682e94f6ab96d6ca449b0c3f76bfd6593d182f422689b31d9dc3bc0b70df210a96d19af9ec2ac
            #x1d38f8572a06ce22c1586a8329f9421414b334352f1e8b961f7e0732ee01e838eb975bfb2f62132bbfd9acc6ef8899b4fd388c2b59e564fc3670da7a008ca016de678d6dded137c
            #x0b050aa7266201a42dbee063ae2a21398ee1d2a190de9fbbce2468836e416b3ec18d7340c81fd2a5283713f9aba33e8cbb105eaa2abbf0b687fe2713921bcbc02a4b77df21f762f
            #x08351115714bc8f29b84a6e3f0a23bdc219d4271a9ee18bdab54c3acc9cb3468beb1f89b0f981da5aa7d7ec7ad451bc5e91bc98440fe20f5877a4e73614820b9ab6f2bad3e2e609
            #x0c64baaeed68178f5a1d8f095b0932fb73f9a02462df5e8378746ecf17d05971a0a287d5a8e0317db055b02d4f4b5864597d0f9a9cb1ae68577dcaf7db09c55bf3d3575197295c9
)

;; [K-571,SHA-384]
#|
  Msg = c6c9de3a2e738e0a7f83059efa24182e82aee2045536b7111979abb06d7c7cc0b33e682f8dac6fbf70ef22999f6eec9e
  d = 01fe06b94a27d551d409b0eb9db0b163fadcf0486e2a6074bafe167f9a3b4ce8ac11f42cf72f9a1833a126b9473163d29bca2ad139dd1a5e7fedf54798bf56507326fae73a3e9a2
  Qx = 38d4dce42bf8fffc39a5b6583a1a1864de288ef8479449d599115bfa35b37954ab288ffbe81e69d58693e2c8c81639df12e4b36f62b2ab042e92a0715b518c63d0ec630051d4be1
  Qy = 59c72c0bfb0ea1ac5e2fdd4fc380d08037a3d0eeed4990ff02e6cf5a16817ea598085e28f8269da86c547e7b34e16a06724ee73776529c5b5dea4ce3321fb168827ca1cbdf8856d
  k = 0a3b18c8c9f17badd123c674869ff428d533d2ecb8c74f9784220be7a90dda591003df5259c5dfb612ac7398aa04cc9e82863eb0cbe66b6e7f45dd15dad252f74a538d5f4354c96
  R = 09c368c80f697c1718c55482b2c6c5c0edd7257a3a53f7193515629aa40a9716cc889d41c120516b54f3a106a171082364886e5d3a1e9482a103f072988f61de68f034d658bd976
  S = 0e782ef47b250f40c56e3ac4de112347174bd59fd4cc991a2b538ca90cdb222d048fec62e2773492a1d327152d1d6591740706fe2f8e1d65de888d47fdf173b2645813ac0fc3078
|#
(test-ecdsa NIST-K-571 no-48
            #xc6c9de3a2e738e0a7f83059efa24182e82aee2045536b7111979abb06d7c7cc0b33e682f8dac6fbf70ef22999f6eec9e
            #x01fe06b94a27d551d409b0eb9db0b163fadcf0486e2a6074bafe167f9a3b4ce8ac11f42cf72f9a1833a126b9473163d29bca2ad139dd1a5e7fedf54798bf56507326fae73a3e9a2
            #x38d4dce42bf8fffc39a5b6583a1a1864de288ef8479449d599115bfa35b37954ab288ffbe81e69d58693e2c8c81639df12e4b36f62b2ab042e92a0715b518c63d0ec630051d4be1
            #x59c72c0bfb0ea1ac5e2fdd4fc380d08037a3d0eeed4990ff02e6cf5a16817ea598085e28f8269da86c547e7b34e16a06724ee73776529c5b5dea4ce3321fb168827ca1cbdf8856d
            #x0a3b18c8c9f17badd123c674869ff428d533d2ecb8c74f9784220be7a90dda591003df5259c5dfb612ac7398aa04cc9e82863eb0cbe66b6e7f45dd15dad252f74a538d5f4354c96
            #x09c368c80f697c1718c55482b2c6c5c0edd7257a3a53f7193515629aa40a9716cc889d41c120516b54f3a106a171082364886e5d3a1e9482a103f072988f61de68f034d658bd976
            #x0e782ef47b250f40c56e3ac4de112347174bd59fd4cc991a2b538ca90cdb222d048fec62e2773492a1d327152d1d6591740706fe2f8e1d65de888d47fdf173b2645813ac0fc3078
)

;; [K-571,SHA-512]
#|
  Msg = 5daf820b8afda9c69584eeb7911260f433abb182d38128f29c874830fef98b9dd6c2dd66527bdceef386ce1558a56209137a4ca8a3ace15b5201291a296f3827
  d = 15b7271d4319db5743119c8103a7d4c6d57e9c62f3eb93762156d2ebd159980aa57cea948e416717d715a2e458851f1b2e9ad4172bbcc53861db29c3ee0ba8e82617a5866170847
  Qx = 03a5b9559b2058299161770166766aa65e151ac6a22a90205afd27de5eb99c5b1db369ad52f09141d3bf08884b96414c283b2669ec2a2a60c960a2f03d425dc4c229c0bb369d90f
  Qy = 024f3a9cf3dd257043dceefe6617a98e222e1cc820f3e19e63c64fdcf7ce8d9c7af7323c9aaaef4df02e498597581082fa3767c8a38f508f4ca2c1eed6f298dc8142668a0027490
  k = 0c585e425ae4a34f9b7b9205f095ea07599716f1eab1a8bbd934219ad760c4606ebbeb06cbfd3952e045a040b8ce20603aea4f965d1b6e87eac7a61672823fb2de7767e3466c730
  R = 129162cce6fb05e1fc8630ec6c3a16d108bcd251719d89631497177e6fe6d1373f114ad9dde6e04a4ee0b4747f91c78703012e5a058c132d54f2ccccfc0f9326b27d60322b497e4
  S = 140163edb5f3c4b49228e4614bfc6da9f73674eab82678ad9947b2a635f733dbce99ce3209f613e2a75e62ed84db4d7d13de6d789b7cfedc0cb6a028d8316db8831db66c91791c5
|#
(test-ecdsa NIST-K-571 no-64
            #x5daf820b8afda9c69584eeb7911260f433abb182d38128f29c874830fef98b9dd6c2dd66527bdceef386ce1558a56209137a4ca8a3ace15b5201291a296f3827
            #x15b7271d4319db5743119c8103a7d4c6d57e9c62f3eb93762156d2ebd159980aa57cea948e416717d715a2e458851f1b2e9ad4172bbcc53861db29c3ee0ba8e82617a5866170847
            #x03a5b9559b2058299161770166766aa65e151ac6a22a90205afd27de5eb99c5b1db369ad52f09141d3bf08884b96414c283b2669ec2a2a60c960a2f03d425dc4c229c0bb369d90f
            #x024f3a9cf3dd257043dceefe6617a98e222e1cc820f3e19e63c64fdcf7ce8d9c7af7323c9aaaef4df02e498597581082fa3767c8a38f508f4ca2c1eed6f298dc8142668a0027490
            #x0c585e425ae4a34f9b7b9205f095ea07599716f1eab1a8bbd934219ad760c4606ebbeb06cbfd3952e045a040b8ce20603aea4f965d1b6e87eac7a61672823fb2de7767e3466c730
            #x129162cce6fb05e1fc8630ec6c3a16d108bcd251719d89631497177e6fe6d1373f114ad9dde6e04a4ee0b4747f91c78703012e5a058c132d54f2ccccfc0f9326b27d60322b497e4
            #x140163edb5f3c4b49228e4614bfc6da9f73674eab82678ad9947b2a635f733dbce99ce3209f613e2a75e62ed84db4d7d13de6d789b7cfedc0cb6a028d8316db8831db66c91791c5
)
