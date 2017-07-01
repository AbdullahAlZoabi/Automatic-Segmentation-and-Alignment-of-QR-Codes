function R = Warp( I1,Pts1,Pts2,XX)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

W = Pts2 * Pts1' *(Pts1 * Pts1')^-1;

R=GeometricLinearTransform_Warp(I1 , W , Pts2,XX);

end

