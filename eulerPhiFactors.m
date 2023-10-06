function factors = eulerPhiFactors(x)
    ep=eulerPhi(x);
    rng=1:ep;
    factors = rng(rem(ep,rng)==0);
    factors = unique([factors sort(ep./factors)]);
end