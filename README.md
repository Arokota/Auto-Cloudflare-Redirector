# Automatic Cloudflare Redirector Deployment

## Description
Attackers often have to find inovative ways in order to blend in with normal traffic on a target network.  One of the best ways is to take advantage of content delivery networks (CDNs) that allow users to hide behind their infrastructure.  A few months ago I had read about the ability to utilize one of Cloudflare's newer features: [Workers](https://workers.cloudflare.com/) for more malicious purposes: C2 redirectors.  With just a small bit of JavaScript, an attacker could have HTTP/S traffic masqueraded behind Cloudflare's SSL cerificate and DOMAIN NAME, and IP range.  

https://ajpc500.github.io/c2/Using-CloudFlare-Workers-as-Redirectors/

After succesfully using this technique several times for various purposes I figured there HAD to be a better way to automate it.  So this repo is the result of that preliminary research, ultimately stopped short due to the fact that I believe the technique is no longer possible :(. (Pending further research) I'd be lying if I said I wasn't dissapointed, but at the same time it's good to see CloudFlare being proactive to stop the abuse of their services.

## Future Work
* Obviously further research is needed in order to determine if there is a way for this capability to still be spun up to work.  If that's not able to be completed then there's no point.
* Other than that I'd really like to be able to easy integration for custom DNS host names to be added and able to be iterated through for redirector names.
* Also Wrangler is a PAIN to install.  I highly suggest following the official documentation and using NPM although it's still really terrible.  Future iterations of this would be nice to use a Docker container version of Wrangler in order to limit bloat.
