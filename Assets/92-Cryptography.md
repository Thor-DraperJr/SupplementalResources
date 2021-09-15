### Asymmetric Encryption
While symmetric encryption has many advantages, its primary disadvantages are key exchange and key management.

As an alternative, we can use asymmetric key encryption, also known as public-key encryption, in which each individual has a two-key pair.

The two-key pair consists of:

* A public key, which can be seen and shared with anyone.
* A private key, which should be kept private and only seen by the owner of the key pair.
* For encryption, the sender of a message uses the receiver's public key to encrypt a message.
* For decryption, the receiver of the encrypted message uses their private key to decrypt the message.
* RSA is the most widely used asymmetric key algorithm used today.
* GPG is a command-line tool that can apply asymmetric encryption.

### Hashing

While encryption is used to protect confidentiality, hashing is a cryptographic method used to protect integrity.

Hashing uses algorithms to convert a plaintext message into a message digest, also known as a hash.

Data that has been hashed cannot be reversed, therefore it is known as a one-way function.

Common hashing algorithms are MD5 and SHA256.

Command-line tools that can be used to create hashes are md5sum and sha256sum.

### Digital Signatures

A digital signature is a mathematical scheme for verifying the authenticity of digital data.

The primary purpose of digital signatures is authentication, but they can also be used for integrity and non-repudiation.

Like encryption, digital signatures also use public key cryptography.

However, a user uses their own private key to sign a document, and the public key is used by other users to validate the signature.
There are several types of digital signatures available: detached, all at once, and clearsigned.

