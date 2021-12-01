# nim cpp --passC:-std=gnu++17 -f flexible_polyline.nim
#{.passc: "-std=c++17".}
#{.compile: "cli.cpp".}
#{.compile: "hf/flexpolyline.h".}

#import cli, hf/flexpolyline
import std/[math, sugar]
when false:
    var p = Polyline3d()
    let encP = cstring"BG6g3lkDimpzZqkBicgKkI8GgF4N0KvW8sC7G0ejDkXTwHnBkIU0jBoB41BwCwwDrOU_JA_iB7BvbvCvHTrJ7B3DT_JjDjXvH7QjIvb3N7kBjSjD7BjS7LrEvCrE_ErE_EzFjIA_EAzF7B_E7BrEvC_E7BvCjDjDjDvC3DnBzFUvHwCvCsErE4I_EA_EA7GnB_E7BzFvCvHrE_OjI7Q_JrJnGzK7G3S_O3NnLnfjczU3S31BjwBnkB_iB3N3N3SvRvMjIzUokBrJ0P_JgP_OoV_O8VnLgU_EkIjIgPnL4XrY8uBrOkcjDoG3SgoB3D4IzF8LrEoLzFwMrO0jB3DsJvW89Bna0mC7Q4wBrTkwB7VouB3I4SjI4NvH8L3NkS7Vwb_JwM_O4S_E8GvCkD_OsTjSkXnLoQ7LoQrJ4NzK8Q_J4S7GkNrO0ejDwHrJ8V7GwRzKkc_Tk1BvH0U3N0oBzK0e_EwMvC8GzFgPnGkSnGwRrJoanV89B7L4hBzFkSnBsE7B8LAkNjD8LvCgK7BsJnGgZ_E4SnVsvCvM8uBnGkXrEwR_EkSrJkhBvHgZjN8uBnL4mB3IwgBvCgKjDwMjI8a3I0e7G8VrE4NvC4IzFkSnakzC3NkrB3S46BrO4rBrJ8frsBwpEzPw0BjNkrBzFkSvHwbrOjS7LnLjSjSzFzFzP7QjcriB7VvbvHjIvCvC7G3IvMnQnfrnBjSjXzU_Y_2B7nCvMnQnG3IvM_TzPvW7G_JnG3IzFvHzFnG_E_E_ErE_EvCvW8fzjBs2B_J4N3DgFjN4SjI8LzFkIjmBs7B3DgF7pBg8BnkB41B7kBg3BzZ4mB3IkNvHoL7GgKjIoL_E8G_EwH7GsJvoC4sD7LkSjhBsxBnLoQrJkN_xBwoC_nB4_BnfgtBnGsJzP8V3copBnG4InLoQ_vCw1D7fozBz8B06C7V8f3N0U7LkSrJsOrE3InVzoBzer7B7LjXzFzKvC_E3DjIjN3X_E3Ij_B_3DzP_dzK_Tna_xBvC_E3hB3_BjIzPvHrO_J3SvH_O3I7Q_O3cjIzP_JrTrEjS_EzPnG7LzK_TnVzoB3IjS_E3IzU3mB7QvgBzZr2BrE3InL3SjIrOrdz3B3SzjBzF_J_ErJ3S_iBrJvRjDnG3X_sB3D_EjInLze3mBrJjNnLnQ7L7QjIrOvH3NnL_Y7BrEnL7a3DrJjS3wB7L7fvHsJ_EoB3DwC3D4DnGkIrEgF7GwHjDArEjDjD_EvH3N3D7G3IvR_E3hB3DrY3DzUrE7Q_E_OrE3IvC_EzFjIjI7GrJzFnL_EjIvCrJ7BrJoBjIUvHwCnG4DzFgFzF0F_EwHrJ8Q_T8kBzK0PnGkIrEoGnQgUrJkIriBgejNoLvMgK7foa_JkI3I8GrT8QzKsJzPwMvvBgoBjc4X3SgP7LkI3IoGzF4DzPoLzZkS7Q8L3NsJjN4In4B4hB_YgP7GsEvjC8pB3mBsYvMkI7L4I7pBwgBvHkI_YoarTwWvb0jBnVofjXokB3NoajS0jBjc84Bn4B0zDnlDwvGzjBkpCjNwbvR0jB_JgUzP8fnGkNvH0PzPkhBvHgPjhBkkCvH0PjIoQ7LgZrJkSrd08B_jD8uG3XgyB3zCsuFj4Cw7FrTopB3XsxBrdo9BnGwMrOgezZw0BjSokBjS8kB_d08BjwBwhD_E0K7B4D7GgP3Noa3N8a_Y4wB_OgejS0jBnaozB7L0ZvWwvB7GgP7LgZjDoGzFoLzK0UvgBoiC7Q0jBrOokBrJwWrOgoB7GoV3DoLvH0ZzFwWjD8LrE4S_EwWvC8L3DkSnBgFvCkNjD4SvCkS_EwlBjD8ajD0e_E0yBnB4NTkI7BgZ3DopBrE4mB_EsnBnGsnB3DsY3D8Q3D8Q3D8L7G4X3DoL3DoL3DoL_EwMjIwR7GsOnG8L_E4I_E4IrE8G3N0UvM0PvCkD3DsErJgKzKoLzKsJzK4IvWsOrOkIzPoGvRoG7QsEvH8B_OwC_J8BvHUzU8BvWoBjwBA_OAnaAjcTzU8BrJoB_JUrOwC_OwC_YwHv0B0P3IkD3hB8LzZ4I_OgF3mBwMnuBkNrJwC_OsE7f0FriBoGnVwCnVwCnaU3IAvWAvHAjNnB3NnBjhBvCna_EnazFrY7G_Y7GjN_ErY3IvlBnQv-BzevlB_TvlBjSvMnG_YzKzP7G_OzFrOjD3S3DvgBnGjX7BvHTjNnB_sB3D7ajDrY_EzKjD3N3D3X3InajN_JzF_TjNrEjD7QnLjhBzZjSzKzUnLnV3IvWzF7VTjX8BrOkDjNsE7GwCnQ4IvMkInLkI_JkIvMoL_dof3csdzFoG7LkN3D4DnG8GzF0FzjB8kB_ToVvbsdvR4SjNsOvCwCvCkD7B8B7LwM_nB8pBzoBkrBjhB0jB_Y4cnL8L3NoQrOwRvMgPnL4NnLsOrOkSrJ8L3I8LvM8QvM8QnL0PnL0PzK0PnLoQ7LwRnLwRvMsT7L4SvMgUvM0UrO4XnassBjzCwuEnVokBjNwW3NkXnQoa_OsYvR8a7QgZvR0ZvRgZjN4SrJwMnL0P7LoQ3IoLrOkS_O4SrOwRzP4SrTwWvRsTvRgU3SgUzUoV7GwHnLoLjSkSnf4c_gC03BjhBwb_iBoarsB8fvgB0UvgBoVvWwMvH4D3SgKnpBwW3wBwWjhBgPvWkI3X4I3X8G3SgFzZ0FzesErJoBvHUzP8BnQwC7V8B3hB8B7fnBvgBnBnkBjDzjBzFvbrEjrBvH3_BvHvbvC_YAn9BsEzP8BzZgFzKwC3DU3NkDzP0FjNgFvRoGnfgP7f0PnQ4I3X4NjhB4S7G4Dr7BkhBj1BgezkDw5BnLoGzFkDrOkIjhB4S7agPn4B8f3coQ3D8BrJgFzhC4hBjwBwWvvBkSjwBgPnuBoLnfgFvlBgF3cwC7foBnVTzjBTvgB7BjhBjDzejD_iBzFjiDnQv8CvR_tD_Tj_BrJvvBzFr2BrEnzBjDrTnB7kBnBnkBUnkBUj1BoBzKU_YoBvCAvgB8Bj1B4D77CoGvR8BnLoBnsCoGzZ8BnLA3X8BvqBsEjwBsEr2BgF3cUv5B4DnV8BjIUvMoB7BAzKU7LoB3IoBjDAnQoB_2BsEjXUrsB4D7LU_gCsEn2C8G7awCnVwCrsB4DnQoBzjBwCvHUvMoBriBwC3IUzKoBjSwCvHoB7VwCzK8BvvBkI3NwC_dgF7VwC7GUjrBsE_dwCzewCrqC0FnuB4DzPoBnfwCzPoBnuB4Dz6C8GrdkDrOUrdkDrdwC3c4D3c0FrOwC3cwH3ckI3csJvb0K7a0KvCoBnQwHzUsJ_YkNzjBoVnf0Uz6Cs7BvMkI3hBsT_iBwW7fgU_sBsd_xBwgBvMkIj1GwpE_pFstDj4C84B3XgPzF4D_EkDvR8L7BoB31BgjB7pB8a7vDonC_9F85D_iBwW_jIwnF34Cw5BvgB0UniCwqBn9BsnB3hB8V3sDgmCjckS3XgPjS8LnpB8avMkIjSoLvMkI3wBofzoBoa7GsEr-Co9B_yD4pCzF4DnG4DzK8GvMkIvwD8nCn6Fg4D_dsTzUkNzrC4wBr8DgwCjSoLrOsJzPgKjNkIrO4IrOkIvM8GvMoG7L0FjNoGjNoGjN0F7LgFvMgFrO0FjIkDjIwCnL4D7L4DzKkDzoBoLztBwM_JwC7uB8LjIwCnxC8Vz_C4XvmD0Z_lMwmDjsDkc39CsYj6BgP3SgF_T0F7QgFjS0FvR0F3S8GvR8GvRwH7QwH_O8GrO8GzPkI_OkIzP4I7QgK7Q0KrOsJnQoL7Q8LrO0KzP8LzPwM3NoLrOwM_OkNrOkNrOkN_OsO3SwRnVgU7VoVvgB0evvBgtBnxC8sC_vCosC31B8zBjhBgezKgKriB0evbsY_JkIna0UzZ8V3mB0evlBsdrE4D3c0U7Q8L_YkS74BopB7sCw0BvR8LzeoVjrB0erJoGj4Cg8Bj_B8pBjrBgZ7foQ3hB0P3wBsT_xB0P_iBkI_xBgK_xBoG_sB4Dj_BgFzyB4DnzB4Dz3BoGzjBsEnuBsJzekI31B4SzoBoQnQwH7fgPjc0P3c8Q7kBwW7VsO3_BouBz4Dk4Cv5B8pB3rBofrnBge3rB8fn9BssBjX8QjhBwb3hBsdvWwWzKgKrEsE_Y0ZjI4Ird4hB_nBwvBna0jBjcsnB_dgtBrE8GjcssB3cozB_YgtBnkBoiCrgCo0D7nCojEriB08BnV8kB3hBw0B_douBrnBw0BrnBsxBnfgjBvWwWjXsY_Y4X3mB0jBz3B8uBzzDg_C7VwRnf0ZvqB8fze0U3DwCzK8G_OsJzK8G_JoG_JoGjXwMzK0FnawMnV4I3XkI7kB0Kv0BgP_OwCnGU_7B4I3IoBvgBwCvlBwC_EUvWwC3cwC3NU7V8BzUoB7VoBvWoBjX8B7VoBnVU_ToB3XAvWAnanB7a7BvW7BjXvCvWvCna3DzZjDzZjDrYjDvbjD_d3Djc3DjXvC_YjDzZjD_YjDj6B7GvhD7LzzD3NroDjNjzC_JnpB_EvtCrJ_5CnLrtDjN34CzKjuCrJvqB_EzP7BvMnB7QnBrT7B_TnBjNT7LA_EArJA_OAzUAjpCnBjSA7LA36BT_TAjmBT_OA_OArnBAjhBAvrDnB_nBTv5G7BvgBAzeU7aUze8Bze8BzewCnfwC7akDrdkD70IsdvrDoLv_D4NvR8BjrBsE7f4D3nDgKv3CgKnoEsOj6BoGryD8LnkBsE_hEwMnxC4I_0CsJzrCkI79BoG7sCsJnkB4DriB4Dn2CoL_-C8Q7oEkc7sHkwBjvJs7B_gCwM_hE8avb0FzFoB3_BkNj1B0K_xBgK_EoB_J8BjuCoQvtC8QvgBsJ3hBoL3mB0P3mBwR7kBsT7fkSjcwRv0BsnBrgC4wBjcsYj1Bw0BnxC0wCnlDsjD_1EgxE_-Co7Cn7C82C3uC4uC_yDovDvkE4gErnB4mBrJsJz6Ck4C_hE09DvtMk_LrwEotE_5Cw3CriBkhBjhBokB3hB4mBjrBg3BriBgtBze0tB3couB_Y8pBjhBo9B7pBs0C_sBg_CzZ03BnV4rB3cw5B7QkmB_dkkC7ag3BnLsY3IgU_T4rBrYw0B_iBsqC3hBwoCj_BgnEnhF43K3mB0wCvgB4_BjhB46BrO4X3IsO7fgyB7VwgB3SsYnGkIvb4hBnpBkwB7fgjBvR4SvH4IvRoQjSwRvbkXnfgZ3coVzFsEjXoQnuB0ezjBsTrEwCnf8QztBsYvH4DnuBgZvgB4S_xBwbvyC4rB_gCgjBzZ4NjN8GvMoGrOkIzP4IrOkI3NkIjNkIvMkIjN4IvM4I3NgKrO0K_JwHvMsJ3NoLvM0KrOwMvMoLvMoLvM8L_JgK_nBopBvHwHrJkIzPgP_O8QjSwWzzD8tE_tDwpE3xD8tEzkD09DnyEkyF3_B4uCniC01CvqBs7Bnf4wBnfk1B3wB87CzoBkzCn7C8kG3c08BzZ03BnkBwjC_T0jB_d0yB3mBo9BzjB0yBvlBkwB3Xkcna0ejhBsiBrY0Z7pBkmB7zBwqB7kBwb_iBkXvlBkXvlBsT_OwHzPkI3IsEjhBkN3hB8LztB4NnQsE7foGriBoG3mB4DnpB4DrsBnBzoBnB3mBzFnkB7GvM7B7LvCvM3D3NrEjIvC7uBrOzerJniC_TrOrEnG7BnajIrtD3hBnsC3XnQ_EvM3DnfrJ7xCzZrqCjXjrBnL7pBjIzoBzFzoBjDvbT_sBoBjSUrToBzesE3hB8GztB0KvbkI3csJ3coLvb8LnpBgU7pBkX7kBwW7kBgZrdoVjc8V_Y8Vvboajckc7awb_dwgBzjB8pBrdkmBzekrBzwCo0D_O8VjI8LnkB8zB_E8G_nBw5B_vCgzD7GgK77HwqLrxG0sJ74BwyCz8Bk4CvgBozB3rB0mCn4GkhL7LsT3c8uBze0yBvCsEnGgK_E4IvC4D7a8pBrsB4pCvjC4sDnkB08BrTwgB3D8GjD0FjDgF3D0FjDgFvbssBj6B49C3c4rB7Vofj1BgrCjpC0pDz8BwyCzK0PvRgZ7GsJ_EwHvC4DrEoGjSgZvH0K3DgF_OoV3mB03B7awlBzeouBvC4D7V0jBvR0evW0oB3XwvBzZw0Bnao9B3SgtBrJgZ_EkN_T41B_0CkpHzZgmCnG8QzFoQnQwvB7asvCnQk1B_JsiBzPk1BnQ89BnuB05F7LozBrYstDvWwrD3D4SrJopBjXsoD3D8Q_EwWjDoQ_E4XnGwb7BsJ_OslCzU49CvC8LvCgKrO8iC3So2C3cwkE3wBw-Gv0B0wH7V0kDnG8arsBgtGzjBglFz3Bg_Hna47D3D4SzZw1D_iB8oE7fkxDvgBkiD3cgwC3conCvMsd3DwH_EkNjIwR3IkSnVgtB3DkIvH0PjmB4pCjrBkuCzoB4_BriBgyBnuBsgCrsBk6B_sB41BrxB8zBzoB0oB_sBopB_2BgtBn4B8pBrxB8f7-DosCvWkN_1Ek4C3pCkrB7oE8xCjX4N3nD89BvpE8xCjc8QzZkS7V4S3IkI3mB4mBjS0UzZ0erTsY_iB0tBnuBsgC3DgF3I8LzjB4wBrJkN_iBgtBvHgKvRsY_YokBzZwqBrT0jB3XsxBrJ8V_EwMzU41BrYoiCnV46BvCoGvR8uBrOsnBjIwW_OgoBnV46BjDkI3DgKvHoV_T41B3DsJnaonCrOsnB_iB0_Cn4B83EriB87CrJ8azKsd3S84B3DkNjDgKrJ0jB3I4mBjIwlBrJo4B7G84B_Eg3B7B8kB3Dg_CnB4rB_E8-DzK83J3D87CnBslCvCkwBvCgmCvCouBjDouBjIkkC7GssB3I0tBrJ4rBvMgtBjNkrBnVsgC7Vs2B7pBwmD_dgrCnQgtBzZsqC_Y4zC3IwgBvHsdnGgZ3IsiB7kBsrEvqBglFzF8VjX01C3DsOjIsd_Os2B3DsO3IwgB_d04DnGoavWg6CnGsY3Xo7C7BwHnBgF_Y0_CrEoQrEkSnG4XzP89B7V8xC7GwbvCsJ_EoVna8lD3N0yBjSkkCzF8V_T4uCzP89B7BoG_JsnBjSslCvRoiC_Og8B3DkNrEgPnG8VnGgU7GoV7GoVvH8V3IgZ3IsYvHgUjIoV7BgF7GwRjIgUjIsTjI4SjIkS3I4S_JoV3IkS3IkS_JsT3I8Q3IoQ_JkSzK4S_JwRnLsTr0CkvE7iC4xDvb8uBvHwMnG0Kj9C4-ErnB0hCvW8kBzPgZnQgZjSkcvR8a7fsxB3_BgkD_mE0yG7G0K_J0PrnG83J_tDwsFnlDw9E3uCs8DnuBonCrjD07E7a8pBz1CsmE3NoVnaopBjIkNnGsJ7kBw5B7sCg4DzyBgwCz8B49CzekwBr0C8jErJsOzoBk_Bnf4wBnQ4XnV8frd8pB_nBk1BnpB8zB7pBsxBjmB8pBzK8LrJsJnzBw0B3mB4mBjhB4hB3SsOvR8LrJ4D3I8B3ITnQnG_OzFjITjIoBvHgFjN0K7QoQ3SkS_EgFvgBgjBvRkS0KkmBoLgoBkDgK4DwR8B4IUsJAkITkNrE8BvCgFnBwH3NkDrJsErOkIzP8QvMwM3SkSvMoLnQ8QrYsdnfsnBrdssB3I4NnL4SjNwWjI4N7GwMnGwMvH0PzF0K7GgPjIoQjI8QzK0ZzKoanG0P7QopB_Yw-BnG0P_d4uCnpBoqDrgCglFrqC4mGnpB8vD_2Bg2EzjBs-C3D0KjwBwpE_J0ZvWk6BjhBg1C3S0yB7V4_B_O0yBvHsdnGge_EgjB_E4mBvCgjBnBkwBoBouBsEs2BoGsxBsJs7B4NgwC4DgekDsd8BkXU4IoB0P8BofoB4rBT0jB7B4rBrEwqBvC8VzFssBrJ0tB_J8pBrOsxB7Qg3BzK0jBvlBk7Drdg_Cvbk4CvW4pCvRs7BjSw5BnG0UzKgjBvH8a3D8QvCkNrEsd7BwlBoB0rCAwMTkXTsO7BkS3DgZnBkIvH0evRk1B3X4_BrO0oBjI4Xr2BggFvqBk7DjhBogD_iB4nD7Q8uBjSo4BzUkkC3Ng3BrO89BjS0kDvCwMjN4pCjSo5DvRs-C_E0erE4c7G8pBjDsT3I41BjwB0iJzKsgCnQ0_C3DkXnGwqBrEof_E8fzK03BvHsnB3D8VrEkXjIgtBnGkmBzKgmCvbwiFnQ8gDzK0hCvWsrEnfw7F3Is2B3DkX3I8zBzU80D3DgUvCsO_E4c7GokB_EoarEsYrTk9C7BkIzUgkD_E4cvMg8B3DkSvHokB7L03B7a0iEzPgrCjcgnErd02E7VwmD_EsYnGgtBnBgP7B4mBvCg8BnBof3DgmCnBokBnGglFjD8sC7Bk6BA8LA8VnBopBzFooE_E8tE7BgtB3DwvBrE4hBnGw5BjDozBnB4cUk6BUsqCoBosC8BssGA4sITw-BAsnBAgU7B01C7B4pCvC0kDjD49C7BouB7B4rBnBwrDToQnBopBnBsxBTsYTgUT8LAsET8L7B46BAgPnB49CjDkxDnG4oFvC8sCjD8qDAk1B8B0rCoB4mBUoaAoLUgKwCopBAkDUsJkD4wBoB8VoBkSwC8f0PwqGoGgkDkD0tBgKsmEwMspFkI0zDkDk1BgF84BgFwqB8G4_B8L0kDsEkhB4D4c0Ko2CkIk_BgF0oB8BgPwM8lD8QkvEw0B0zN8BgPgFwgBsE0oB4D4hBsEgoBsE8kBsOo0D8BgPwCsT4DkcgF8pBwC4S8B8LoBwHwCoQwC0P0FoVwCgKsJwbsJwgB8BkI8BkIoBoGoB0F4D4SsEgjBgUgkDkNkkC4IouBUgFsEwWoLk1B0FkcgF0egU04DwMonC8BsJwC0PwHssB8BwRoBoQUwbAoaoB0yBoBsgCsE8kGgF0kD8BwgBoB8fwCwvB8B8fgFo7CoB4X8BkrB8B4hBgjBrE8zBnG8ajDoL7BoL7BwM7BoQjD8LnBkN7BsOnBwHwCoGU0FT8LnBwMnBkInBgK7BjD0KzFsjDjDkmB7BsTvC8aU4SvCoa3mBvCUs2B"
    let e = polyline_decode(encP, p)
#{.importc.}

type
    DeEncodeError* = object of ValueError

const
    defaultPrecision = 5
    encodingTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
    decodingTable = [
        62, -1, -1, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1,
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
        22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
        36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51
    ]
    formatVersion = 1
    absent = 0
    level = 1
    altitude = 2
    elevation = 3
    #Reserved values 4 and 5 should not be selectable
    custom1 = 6
    custom2 = 7


func decodeChar(c: char): int {.inline.} =
    decodingTable[c.int - 45]

proc decodeUnsignedValues(encoded: string): seq[int] =
    var res, shift: int
    for c in encoded:
        let val = decodeChar(c)
        res = res or ((val and 0x1F) shl shift)
        if (val and 0x20) == 0:
            result.add res
            res = 0
            shift = 0
        else:
            shift += 5
    if shift > 0:
        raise newException(DeEncodeError, "Invalid encoding")


proc decodeHeader(version, encodedHeader: int): tuple[precision, thirdDim, thirdDimPrecision: int] =
    if version != formatVersion:
        raise newException(DeEncodeError, "Invalid format version")
    let headerNumber = encodedHeader
    result.precision = headerNumber and 15
    result.thirdDim = (headerNumber shr 4) and 7
    result.thirdDimPrecision = (headerNumber shr 7) and 15


func toSigned(val: int):int {.inline.} =
    # Decode the sign from an unsigned value
    result = val
    if (result and 1) != 0:
        result = not result
    result = result shr 1


proc decode*(encoded: string): tuple[precision, thirdDim, thirdDimPrecision: int, polyline: seq[seq[float]]] =
    let
        decoder = decodeUnsignedValues(encoded)
        header = decodeHeader(decoder[0], decoder[1])
        factorDegree = 10 ^ header.precision
        factorZ = 10 ^ header.thirdDimPrecision
        thirdDim = header.thirdDim
    result.precision = header.precision
    result.thirdDim = header.thirdDim
    result.thirdDimPrecision = header.thirdDimPrecision
    var
        lastLat, lastLng, lastZ: float
    let step =
        if thirdDim != 0:
            3
        else:
            2
    result.polyline = collect:
        for i in countup(2, decoder.high, step):
            let
                deltaLat = toSigned(decoder[i]) / factorDegree
                deltaLng = toSigned(decoder[i + 1]) / factorDegree
            lastLat += deltaLat
            lastLng += deltaLng
            if thirdDim != 0:
                let deltaZ = toSigned(decoder[i + 2]) / factorZ
                lastZ += deltaZ
                @[lastLat, lastLng, lastZ]
            else:
                @[lastLat, lastLng]
    


