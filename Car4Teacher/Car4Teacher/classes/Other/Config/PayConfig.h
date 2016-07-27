//
//  PayConfig.h
//  Haigoucang
//
//  Created by apple开发 on 15/10/28.
//  Copyright © 2015年 apple开发. All rights reserved.
//

#ifndef PayConfig_h
#define PayConfig_h

//MARK:支付宝支付   正式环境
//合作者ID
#define alipay_partner @"2088121603105843"

//收款账号
#define alipay_seller @"billing@bishe.com"

//private Key  私钥
#define alipay_privateKey  @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAOTEdbns87SFRATjIyYwV9vCziXC6IBXERezC1mDleXvbc92OxgNoUMCNyo4GdTMoiyxgIxyCwHPsp6yoLWUMLQke9CVzQYqzy6PjdPWd/12NQZmzzIOC79Syll97E77xsYIa6p7miW9aEFI3eE6jdw5YcckMVxHLK6Hee2f1ZkzAgMBAAECgYBxNKMJWa+TwmrRfFEVgdDIaFM5LoV9lRhZQPm51zrjaSNPCbPeiEgn7726v75Qpt8N/NyfI4Q85jn+/Gg40tdyLdGFjyGDOuFoE37CsYkX9FxDnPPvHhe1UmKrF5CFEZ7z80Y26vPmDS5KtG3jHr4qfXHSluKOyrdxxuWjn7UJ4QJBAP7uUKDGtvRiLld7YrecAVXYy2LZnvmL4RAR0DUOX+oGAAhOnXXZ6TPJLLryKQFc3ub7LsF0eEhQWsVp/tE7fwMCQQDlug6DChBgM7d8x6ndqsWT1dEu44FdzzpfCx/EmHbnGGudsZm953HBk7bby5B3QdMuOrzZUs9Z9bOTpulDUA4RAj9CuBxh95/qVcfLHX+4jhvLW/He7RWuOe2tRvw25owzs15OzkRnk6B07THHu5j/wk6UJSkXeGQCiQU4pYULPYcCQQCmT/qtl52faBGQvqQVnMqJaqSUg5Rmq94gbNdE5vQ9/gn7Elaxi1tpv10E5uzhyb/vmgqacz82a5DkdlQtrUlhAkEA78rqKPjeAvZBf5fo0XvoZ+hKdi/DKvInCvC08N6ah2XTnW7Z2WZibPu0pz9YIDhA0TUvEkCbEgYFT+4rtKL8ZQ==";

// 支付结果回调地址
#define AlipayBackURL  [NSString stringWithFormat:@"%@/paynotify/alipay.php",Host]

#endif /* PayConfig_h */
