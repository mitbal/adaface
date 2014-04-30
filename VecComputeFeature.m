function [ fs ] = VecComputeFeature( ii_ims, ftype_vec )
%function VecComputeFeature compute certain feature ftype_vec from all
%integral images in ii_ims

    fs = ii_ims * ftype_vec;

end
