# This file has been generated by node2nix 1.7.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@types/caseless-0.12.2" = {
      name = "_at_types_slash_caseless";
      packageName = "@types/caseless";
      version = "0.12.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/caseless/-/caseless-0.12.2.tgz";
        sha512 = "6ckxMjBBD8URvjB6J3NcnuAn5Pkl7t3TizAg+xdlzzQGSPSmBcXf8KoIH0ua/i+tio+ZRUHEXp0HEmvaR4kt0w==";
      };
    };
    "@types/escape-html-0.0.20" = {
      name = "_at_types_slash_escape-html";
      packageName = "@types/escape-html";
      version = "0.0.20";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/escape-html/-/escape-html-0.0.20.tgz";
        sha512 = "6dhZJLbA7aOwkYB2GDGdIqJ20wmHnkDzaxV9PJXe7O02I2dSFTERzRB6JrX6cWKaS+VqhhY7cQUMCbO5kloFUw==";
      };
    };
    "@types/node-12.12.8" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "12.12.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-12.12.8.tgz";
        sha512 = "XLla8N+iyfjvsa0KKV+BP/iGSoTmwxsu5Ci5sM33z9TjohF72DEz95iNvD6pPmemvbQgxAv/909G73gUn8QR7w==";
      };
    };
    "@types/request-2.48.3" = {
      name = "_at_types_slash_request";
      packageName = "@types/request";
      version = "2.48.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/request/-/request-2.48.3.tgz";
        sha512 = "3Wo2jNYwqgXcIz/rrq18AdOZUQB8cQ34CXZo+LUwPJNpvRAL86+Kc2wwI8mqpz9Cr1V+enIox5v+WZhy/p3h8w==";
      };
    };
    "@types/tough-cookie-2.3.5" = {
      name = "_at_types_slash_tough-cookie";
      packageName = "@types/tough-cookie";
      version = "2.3.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/tough-cookie/-/tough-cookie-2.3.5.tgz";
        sha512 = "SCcK7mvGi3+ZNz833RRjFIxrn4gI1PPR3NtuIS+6vMkvmsGjosqTJwRt5bAEFLRz+wtJMWv8+uOnZf2hi2QXTg==";
      };
    };
    "ajv-6.10.2" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.10.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.10.2.tgz";
        sha512 = "TXtUUEYHuaTEbLZWIKUr5pmBuhDLy+8KYtPYdcV8qC+pOZL+NKqYwvWSRrVXHn+ZmRRAu8vJTAznH7Oag6RVRw==";
      };
    };
    "asn1-0.2.4" = {
      name = "asn1";
      packageName = "asn1";
      version = "0.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/asn1/-/asn1-0.2.4.tgz";
        sha512 = "jxwzQpLQjSmWXgwaCZE9Nz+glAG01yF1QnWgbhGwHI5A6FRIEY6IVqtHhIepHqI7/kyEyQEagBC5mBEFlIYvdg==";
      };
    };
    "assert-plus-1.0.0" = {
      name = "assert-plus";
      packageName = "assert-plus";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz";
        sha1 = "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "aws-sign2-0.7.0" = {
      name = "aws-sign2";
      packageName = "aws-sign2";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz";
        sha1 = "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8";
      };
    };
    "aws4-1.8.0" = {
      name = "aws4";
      packageName = "aws4";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws4/-/aws4-1.8.0.tgz";
        sha512 = "ReZxvNHIOv88FlT7rxcXIIC0fPt4KZqZbOlivyWtXLt8ESx84zd3kMC6iK5jVeS2qt+g7ftS7ye4fi06X5rtRQ==";
      };
    };
    "bcrypt-pbkdf-1.0.2" = {
      name = "bcrypt-pbkdf";
      packageName = "bcrypt-pbkdf";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz";
        sha1 = "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e";
      };
    };
    "caseless-0.12.0" = {
      name = "caseless";
      packageName = "caseless";
      version = "0.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz";
        sha1 = "1b681c21ff84033c826543090689420d187151dc";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "core-util-is-1.0.2" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    };
    "dashdash-1.14.1" = {
      name = "dashdash";
      packageName = "dashdash";
      version = "1.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz";
        sha1 = "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0";
      };
    };
    "debug-2.6.9" = {
      name = "debug";
      packageName = "debug";
      version = "2.6.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz";
        sha512 = "bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "docopt-0.6.2" = {
      name = "docopt";
      packageName = "docopt";
      version = "0.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/docopt/-/docopt-0.6.2.tgz";
        sha1 = "b28e9e2220da5ec49f7ea5bb24a47787405eeb11";
      };
    };
    "ecc-jsbn-0.1.2" = {
      name = "ecc-jsbn";
      packageName = "ecc-jsbn";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz";
        sha1 = "3a83a904e54353287874c564b7549386849a98c9";
      };
    };
    "escape-html-1.0.3" = {
      name = "escape-html";
      packageName = "escape-html";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz";
        sha1 = "0258eae4d3d0c0974de1c169188ef0051d1d1988";
      };
    };
    "extend-3.0.2" = {
      name = "extend";
      packageName = "extend";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz";
        sha512 = "fjquC59cD7CyW6urNXK0FBufkZcoiGG80wTuPujX590cB5Ttln20E2UB4S/WARVqhXffZl2LNgS+gQdPIIim/g==";
      };
    };
    "extsprintf-1.3.0" = {
      name = "extsprintf";
      packageName = "extsprintf";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz";
        sha1 = "96918440e3041a7a414f8c52e3c574eb3c3e1e05";
      };
    };
    "fast-deep-equal-2.0.1" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-2.0.1.tgz";
        sha1 = "7b05218ddf9667bf7f370bf7fdb2cb15fdd0aa49";
      };
    };
    "fast-json-stable-stringify-2.0.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz";
        sha1 = "d5142c0caee6b1189f87d3a76111064f86c8bbf2";
      };
    };
    "forever-agent-0.6.1" = {
      name = "forever-agent";
      packageName = "forever-agent";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      };
    };
    "form-data-2.3.3" = {
      name = "form-data";
      packageName = "form-data";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz";
        sha512 = "1lLKB2Mu3aGP1Q/2eCOx0fNbRMe7XdwktwOruhfqqd0rIJWwN4Dh+E3hrPSlDCXnSR7UtZ1N38rVXm+6+MEhJQ==";
      };
    };
    "form-data-2.5.1" = {
      name = "form-data";
      packageName = "form-data";
      version = "2.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-2.5.1.tgz";
        sha512 = "m21N3WOmEEURgk6B9GLOE4RuWOFf28Lhh9qGYeNlGq4VDXUlJy2th2slBNU8Gp8EzloYZOibZJ7t5ecIrFSjVA==";
      };
    };
    "get-stdin-4.0.1" = {
      name = "get-stdin";
      packageName = "get-stdin";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-stdin/-/get-stdin-4.0.1.tgz";
        sha1 = "b968c6b0a04384324902e8bf1a5df32579a450fe";
      };
    };
    "getpass-0.1.7" = {
      name = "getpass";
      packageName = "getpass";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz";
        sha1 = "5eff8e3e684d569ae4cb2b1282604e8ba62149fa";
      };
    };
    "githubhook-1.9.3" = {
      name = "githubhook";
      packageName = "githubhook";
      version = "1.9.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/githubhook/-/githubhook-1.9.3.tgz";
        sha512 = "HLbXqgalcVixWyTqR0mokWGKZiBl1ydMRmb1lCaEYIXDG2axefMqvjh7ENxk5zug3+diu7STFkrICQ80Rg3V9A==";
      };
    };
    "har-schema-2.0.0" = {
      name = "har-schema";
      packageName = "har-schema";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz";
        sha1 = "a94c2224ebcac04782a0d9035521f24735b7ec92";
      };
    };
    "har-validator-5.1.3" = {
      name = "har-validator";
      packageName = "har-validator";
      version = "5.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.3.tgz";
        sha512 = "sNvOCzEQNr/qrvJgc3UG/kD4QtlHycrzwS+6mfTrrSq97BvaYcPZZI1ZSqGSPR73Cxn4LKTD4PttRwfU7jWq5g==";
      };
    };
    "http-signature-1.2.0" = {
      name = "http-signature";
      packageName = "http-signature";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz";
        sha1 = "9aecd925114772f3d95b65a60abb8f7c18fbace1";
      };
    };
    "is-typedarray-1.0.0" = {
      name = "is-typedarray";
      packageName = "is-typedarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz";
        sha1 = "e479c80858df0c1b11ddda6940f96011fcda4a9a";
      };
    };
    "isstream-0.1.2" = {
      name = "isstream";
      packageName = "isstream";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    };
    "jsbn-0.1.1" = {
      name = "jsbn";
      packageName = "jsbn";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz";
        sha1 = "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513";
      };
    };
    "json-schema-0.2.3" = {
      name = "json-schema";
      packageName = "json-schema";
      version = "0.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema/-/json-schema-0.2.3.tgz";
        sha1 = "b480c892e59a2f05954ce727bd3f2a4e882f9e13";
      };
    };
    "json-schema-traverse-0.4.1" = {
      name = "json-schema-traverse";
      packageName = "json-schema-traverse";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha512 = "xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==";
      };
    };
    "json-stringify-safe-5.0.1" = {
      name = "json-stringify-safe";
      packageName = "json-stringify-safe";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      };
    };
    "jsprim-1.4.1" = {
      name = "jsprim";
      packageName = "jsprim";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsprim/-/jsprim-1.4.1.tgz";
        sha1 = "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2";
      };
    };
    "mime-db-1.42.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.42.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.42.0.tgz";
        sha512 = "UbfJCR4UAVRNgMpfImz05smAXK7+c+ZntjaA26ANtkXLlOe947Aag5zdIcKQULAiF9Cq4WxBi9jUs5zkA84bYQ==";
      };
    };
    "mime-types-2.1.25" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.25";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.25.tgz";
        sha512 = "5KhStqB5xpTAeGqKBAMgwaYMnQik7teQN4IAzC7npDv6kzeU6prfkR67bc87J1kWMPGkoaZSq1npmexMgkmEVg==";
      };
    };
    "ms-2.0.0" = {
      name = "ms";
      packageName = "ms";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz";
        sha1 = "5608aeadfc00be6c2901df5f9861788de0d597c8";
      };
    };
    "multiline-1.0.2" = {
      name = "multiline";
      packageName = "multiline";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/multiline/-/multiline-1.0.2.tgz";
        sha1 = "69b1f25ff074d2828904f244ddd06b7d96ef6c93";
      };
    };
    "nan-2.14.0" = {
      name = "nan";
      packageName = "nan";
      version = "2.14.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/nan/-/nan-2.14.0.tgz";
        sha512 = "INOFj37C7k3AfaNTtX8RhsTw7qRy7eLET14cROi9+5HAVbbHuIWUHEauBv5qT4Av2tWasiTY1Jw6puUNqRJXQg==";
      };
    };
    "oauth-sign-0.9.0" = {
      name = "oauth-sign";
      packageName = "oauth-sign";
      version = "0.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.9.0.tgz";
        sha512 = "fexhUFFPTGV8ybAtSIGbV6gOkSv8UtRbDBnAyLQw4QPKkgNlsH2ByPGtMUqdWkos6YCRmAqViwgZrJc/mRDzZQ==";
      };
    };
    "performance-now-2.1.0" = {
      name = "performance-now";
      packageName = "performance-now";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz";
        sha1 = "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b";
      };
    };
    "psl-1.4.0" = {
      name = "psl";
      packageName = "psl";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.4.0.tgz";
        sha512 = "HZzqCGPecFLyoRj5HLfuDSKYTJkAfB5thKBIkRHtGjWwY7p1dAyveIbXIq4tO0KYfDF2tHqPUgY9SDnGm00uFw==";
      };
    };
    "punycode-1.4.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz";
        sha1 = "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "qs-6.5.2" = {
      name = "qs";
      packageName = "qs";
      version = "6.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/qs/-/qs-6.5.2.tgz";
        sha512 = "N5ZAX4/LxJmF+7wN74pUD6qAh9/wnvdQcjq9TZjevvXzSUo7bfmw91saqMjzGS2xq91/odN2dW/WOl7qQHNDGA==";
      };
    };
    "request-2.88.0" = {
      name = "request";
      packageName = "request";
      version = "2.88.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/request/-/request-2.88.0.tgz";
        sha512 = "NAqBSrijGLZdM0WZNsInLJpkJokL72XYjUpnB0iwsRgxh7dB6COrHnTBNwN0E+lHDAJzu7kLAkDeY08z2/A0hg==";
      };
    };
    "safe-buffer-5.2.0" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.0.tgz";
        sha512 = "fZEwUGbVl7kouZs1jCdMLdt95hdIv0ZeHg6L7qPeciMZhZ+/gdesW4wgTARkrFWEpspjEATAzUGPG8N2jJiwbg==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "sshpk-1.16.1" = {
      name = "sshpk";
      packageName = "sshpk";
      version = "1.16.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/sshpk/-/sshpk-1.16.1.tgz";
        sha512 = "HXXqVUq7+pcKeLqqZj6mHFUMvXtOJt1uoUx09pFW6011inTMxqI8BA8PM95myrIyyKwdnzjdFjLiE6KBPVtJIg==";
      };
    };
    "strip-indent-1.0.1" = {
      name = "strip-indent";
      packageName = "strip-indent";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-indent/-/strip-indent-1.0.1.tgz";
        sha1 = "0c7962a6adefa7bbd4ac366460a638552ae1a0a2";
      };
    };
    "tough-cookie-2.4.3" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.4.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.4.3.tgz";
        sha512 = "Q5srk/4vDM54WJsJio3XNn6K2sCG+CQ8G5Wz6bZhRZoAe/+TxjWB/GlFAnYEbkYVlON9FMk/fE3h2RLpPXo4lQ==";
      };
    };
    "tunnel-agent-0.6.0" = {
      name = "tunnel-agent";
      packageName = "tunnel-agent";
      version = "0.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
        sha1 = "27a5dea06b36b04a0a9966774b290868f0fc40fd";
      };
    };
    "tweetnacl-0.14.5" = {
      name = "tweetnacl";
      packageName = "tweetnacl";
      version = "0.14.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz";
        sha1 = "5ae68177f192d4456269d108afa93ff8743f4f64";
      };
    };
    "typedarray-to-buffer-3.1.5" = {
      name = "typedarray-to-buffer";
      packageName = "typedarray-to-buffer";
      version = "3.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz";
        sha512 = "zdu8XMNEDepKKR+XYOXAVPtWui0ly0NtohUscw+UmaHiAWT8hrV1rr//H6V+0DvJ3OQ19S979M0laLfX8rm82Q==";
      };
    };
    "typescript-3.7.2" = {
      name = "typescript";
      packageName = "typescript";
      version = "3.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/typescript/-/typescript-3.7.2.tgz";
        sha512 = "ml7V7JfiN2Xwvcer+XAf2csGO1bPBdRbFCkYBczNZggrBZ9c7G3riSUeJmqEU5uOtXNPMhE3n+R4FA/3YOAWOQ==";
      };
    };
    "uri-js-4.2.2" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz";
        sha512 = "KY9Frmirql91X2Qgjry0Wd4Y+YTdrdZheS8TFwvkbLWf/G5KNJDCh6pKL5OZctEW4+0Baa5idK2ZQuELRwPznQ==";
      };
    };
    "uuid-3.3.3" = {
      name = "uuid";
      packageName = "uuid";
      version = "3.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-3.3.3.tgz";
        sha512 = "pW0No1RGHgzlpHJO1nsVrHKpOEIxkGg1xB+v0ZmdNH5OAeAwzAVrCnI2/6Mtx+Uys6iaylxa+D3g4j63IKKjSQ==";
      };
    };
    "verror-1.10.0" = {
      name = "verror";
      packageName = "verror";
      version = "1.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz";
        sha1 = "3a105ca17053af55d6e270c1f8288682e18da400";
      };
    };
    "websocket-1.0.30" = {
      name = "websocket";
      packageName = "websocket";
      version = "1.0.30";
      src = fetchurl {
        url = "https://registry.npmjs.org/websocket/-/websocket-1.0.30.tgz";
        sha512 = "aO6klgaTdSMkhfl5VVJzD5fm+Srhh5jLYbS15+OiI1sN6h/RU/XW6WN9J1uVIpUKNmsTvT3Hs35XAFjn9NMfOw==";
      };
    };
    "yaeti-0.0.6" = {
      name = "yaeti";
      packageName = "yaeti";
      version = "0.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/yaeti/-/yaeti-0.0.6.tgz";
        sha1 = "f26f484d72684cf42bedfb76970aa1608fbf9577";
      };
    };
  };
in
{
  "github-bot-github:smogon/GitHub-Bot" = nodeEnv.buildNodePackage {
    name = "psdevbot";
    packageName = "psdevbot";
    version = "0.1.0";
    src = fetchgit {
      url = "git://github.com/smogon/GitHub-Bot";
      rev = "c1ff4b8576e1735bcdf9fcf6812afd042175ae38";
      sha256 = "6441c4406941b3caa15b627137c2b102c3a5fc657a9bac637d0ceab711a832d1";
    };
    dependencies = [
      sources."@types/caseless-0.12.2"
      sources."@types/escape-html-0.0.20"
      sources."@types/node-12.12.8"
      (sources."@types/request-2.48.3" // {
        dependencies = [
          sources."form-data-2.5.1"
        ];
      })
      sources."@types/tough-cookie-2.3.5"
      sources."ajv-6.10.2"
      sources."asn1-0.2.4"
      sources."assert-plus-1.0.0"
      sources."asynckit-0.4.0"
      sources."aws-sign2-0.7.0"
      sources."aws4-1.8.0"
      sources."bcrypt-pbkdf-1.0.2"
      sources."caseless-0.12.0"
      sources."combined-stream-1.0.8"
      sources."core-util-is-1.0.2"
      sources."dashdash-1.14.1"
      sources."debug-2.6.9"
      sources."delayed-stream-1.0.0"
      sources."docopt-0.6.2"
      sources."ecc-jsbn-0.1.2"
      sources."escape-html-1.0.3"
      sources."extend-3.0.2"
      sources."extsprintf-1.3.0"
      sources."fast-deep-equal-2.0.1"
      sources."fast-json-stable-stringify-2.0.0"
      sources."forever-agent-0.6.1"
      sources."form-data-2.3.3"
      sources."get-stdin-4.0.1"
      sources."getpass-0.1.7"
      sources."githubhook-1.9.3"
      sources."har-schema-2.0.0"
      sources."har-validator-5.1.3"
      sources."http-signature-1.2.0"
      sources."is-typedarray-1.0.0"
      sources."isstream-0.1.2"
      sources."jsbn-0.1.1"
      sources."json-schema-0.2.3"
      sources."json-schema-traverse-0.4.1"
      sources."json-stringify-safe-5.0.1"
      sources."jsprim-1.4.1"
      sources."mime-db-1.42.0"
      sources."mime-types-2.1.25"
      sources."ms-2.0.0"
      sources."multiline-1.0.2"
      sources."nan-2.14.0"
      sources."oauth-sign-0.9.0"
      sources."performance-now-2.1.0"
      sources."psl-1.4.0"
      sources."punycode-2.1.1"
      sources."qs-6.5.2"
      sources."request-2.88.0"
      sources."safe-buffer-5.2.0"
      sources."safer-buffer-2.1.2"
      sources."sshpk-1.16.1"
      sources."strip-indent-1.0.1"
      (sources."tough-cookie-2.4.3" // {
        dependencies = [
          sources."punycode-1.4.1"
        ];
      })
      sources."tunnel-agent-0.6.0"
      sources."tweetnacl-0.14.5"
      sources."typedarray-to-buffer-3.1.5"
      sources."typescript-3.7.2"
      sources."uri-js-4.2.2"
      sources."uuid-3.3.3"
      sources."verror-1.10.0"
      sources."websocket-1.0.30"
      sources."yaeti-0.0.6"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Bot that reports changes to Pokemon Showdown on Pokemon Showdown";
      license = "MIT";
    };
    production = false;
    bypassCache = true;
    reconstructLock = true;
  };
}