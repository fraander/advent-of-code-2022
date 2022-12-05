//
//  Day3.swift
//  advent-of-code
//
//  Created by Frank Anderson on 12/3/22.
//

import Foundation

class Day3Problem1: Challenge {
    static func run(input: String) -> String {
        let split = input.components(separatedBy: "\n") // separate every new line into an element of the array
        
        var score = 0
        split.forEach {
            let sack = Array($0)
            let half = sack.count / 2
            
            let lhs = sack[0..<half] // array of lhs
            let rhs = sack[half..<sack.count] // array of rhs
            
            var duplicate = ""
            lhs.forEach { lhsItem in
                rhs.forEach { rhsItem in
                    if lhsItem == rhsItem {
                        duplicate = String(lhsItem)
                    }
                }
            }
            
            score += strToScore(str: duplicate)
        }
        
        return String(score)
    }
    
    static func check() -> Bool {
        return Day3Problem1.run(input: Day3_SampleInput) == Day3_SampleOutput
    }
    
    static func strToScore(str: String) -> Int {
        return caseToScore(str: str, currScore: charToScore(str: str))
    }
    
    static func caseToScore(str: String, currScore: Int) -> Int {
        let char = Character(str)
        
        if char.isUppercase {
            return 26 + currScore
        } else {
            return currScore
        }
    }
    
    static func charToScore(str: String) -> Int {
        switch str.lowercased() {
            case "a":
                return 1
            case "b":
                return 2
            case "c":
                return 3
            case "d":
                return 4
            case "e":
                return 5
            case "f":
                return 6
            case "g":
                return 7
            case "h":
                return 8
            case "i":
                return 9
            case "j":
                return 10
            case "k":
                return 11
            case "l":
                return 12
            case "m":
                return 13
            case "n":
                return 14
            case "o":
                return 15
            case "p":
                return 16
            case "q":
                return 17
            case "r":
                return 18
            case "s":
                return 19
            case "t":
                return 20
            case "u":
                return 21
            case "v":
                return 22
            case "w":
                return 23
            case "x":
                return 24
            case "y":
                return 25
            case "z":
                return 26
            default:
                fatalError("Invalid char " + str)
        }
    }
}

class Day3Problem2: Challenge {
    static func run(input: String) -> String {
        let split = input.components(separatedBy: "\n") // separate every new line into an element of the array
        let alpha = Array("abcdefghijklmnopqrstuvwxyz" + "abcdefghijklmnopqrstuvwxyz".uppercased())
        
        var score = 0
        for i in stride(from: 0, to: split.count - 2, by: 3) {
        innerLoop: for a in alpha {
            if (split[i].contains(a)
                && split[i + 1].contains(a)
                && split[i + 2].contains(a)) {
                score += Day3Problem1.strToScore(str: String(a))
                break innerLoop
            }
        }
        }
        
        return String(score)
    }
    
    static func check() -> Bool {
        return Day3Problem2.run(input: Day3_P2_SampleInput) == Day3_P2_SampleOutput
    }
}


let Day3_SampleInput: String = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
// 1st sack: `vJrwpWtwJgWrhcsFMMfFFhFp` has `vJrwpWtwJgWr` in 1st, `hcsFMMfFFhFp` in 2nd. Only item in both is `p`
// 2nd sack: `jqHRNqRjqzjGDLGL` and `rsFMfFZSrLrFZsSL`. Both have `L`
// 3rd sack: `PmmdzqPrV` and `vPwwTWBwg`. Both have `P`
// 4th sack: share `v`
// 5th sack: share `t`
// 6th sack: share `s`

// To help prioritize item rearrangement, every item type can be converted to a priority:
// Lowercase item types a through z have priorities 1 through 26.
// Uppercase item types A through Z have priorities 27 through 52.

//In the above example, the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157.
// Find the sum of the priorities of the duplcates from each pairing of sacks


let Day3_SampleOutput: String = "157"

let Day3_P2_SampleInput: String = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

let Day3_P2_SampleOutput: String = "70"

let Day3_RealInput: String = """
LdHVLDLDdHdtLMhcqCqGWcWg
ZZQZSZnnJrQrJQJbfzfnWGWPWMcChMMPcqMnhFcF
ZrzpWzfbpQpWbzvZWZpdtVtDNmRHNVptNDHt
gzCjffWZCtCfZZVdqVSqJdvJndSt
hMHLcmGLMLhHmsRMsSvsQSqrsrlJTTdV
NPNGRGHGHNLczNzzZFWSFFCC
VSBpcvNNbNWWSfGRwtJnRtrzzGzGGn
jZlhTlQLHFLLZbwrzQQsttDtbs
hmmPFlhLmhLMgFMFLbMBBgcNVcfNCcfSVSSNBq
jRDSzjCjjMRMrHzMRCDHMDjBnlQbbnQwLwrNLPwnTPQrlc
sZBqdZqsWgFBpgppGJqllPllwnbQwTwsswQPwN
gJgtJJBtqJqWBGzjRCHDDzRmDtVV
GRBWbbWnGNhbwSsfPfmrlslWsS
HLVCgCLpMgcLVDcDCgmlvstSlsstPtSSSlscvl
LzQDQzMMzJzFQVDJgCzJHJZRZBNbqGFhNFwBGhbhBhBm
JNsHhdPZSdZJjSHzzNwvwGgBFmBmvptJbFvm
WrDrwqqqQWVMCvMvGbGbbFFbFp
rqqLncqnlCncwQWCwWlLfSZPsZddfzzNNdhdPlZz
rwfrwHqSdRcgwdZrDcrqDDdgNzjNjPzPJNJPtbNPbGsHNGHv
hllLMTLLQMCzJssPsTvtFG
QtQnpWVVMVWnVQpRZSSwZDggrcSq
FDlqPMBdmbqMrdDqqFdFDwjHZChHHZfZWZNBsZjhfhHf
VQJVgncpTQRJfsssGhsNWC
NtpLLSpcLVRzzRRtpgVcLgglMwwlPlzdmDlFmFPDmqqwlF
PqwwSqNWPqwSWqjNBwpTPpffhJfZfstRtZJRRdJsdR
VFLFzQVgVnDVjhdJHsvhZjfg
VVFVDDnmnzLFCzVmznFzrFlrjSCPNMBCSGSGwwwGBjPNWPwC
zzbCGrfgbzfzCtvqdjSrvSjnvS
cNVTLnJZRNNmQmhJNptvBlBtVjlljqqldtlB
ZhpcJHLQhRcLZLmNQJzfFwDzzgHPFngDPPnP
ttntdMMBZzbZZtjPfwjwTwBvvVmh
llSllRRNsGCrCDTPfgVgTfgvsjPH
CFclcCWGrJNDSnnWMbQTnWtLQd
bccfdSfwFsswcbbdJFGQVGnCJLnBLnDnQLDj
ThvHZNhZmqNWMNqvDVjcjjBQVhQBBVLB
vWMZZNRmNMWqtWqmqHclfFgdlwRwrzzSfwbFRd
WNzRWWZNmtNZnssNRPtCJFQJCffVJVffCvlF
cBqBLgHHBcgqBbCJjrvrVQJfsHlr
DhDShwchBSbdwBsqgGcbgTTRmzdNWmMRMmTdNpTMmW
FHWZDbbPZDFHgGGPdPbJNLpJSlNjcjSphcJjFN
ZCCrBBRwwCjcNwcljppN
CmTTsrMfBCRsTMnnCRTmVZbgdbdGfWHPDVvdbbPV
cgSNBScMgjBBPtBCNLVvVVvhhJJhvsMhVfWq
TFlDrHPZHTTFmwTQHZDZTrqvvzqlJppVJvpffhqqVfJp
DbPwrTZDQDRQQwQZrDrbbQwRRnNSBtCjtcNGjSgSLjLccC
pdcVCpdZnZgcZgdcDWBDNcNwvBWJwc
RRmHspRmmQfLwwJJbFBFFJNR
rGlpfrQrqGhGqdGP
THhNsHhdFjcDthDcjDhLBqWcLLQQJvvBbvBJbl
GfrCSZGCzfVMrVCCzGVfSMQBBFlJlJBFFZqvWBqbbQWl
rSrFwCwzMMzRfGrGMwPfGCVdgHDttthNPssHjmNNdDjgdD
shmhggDsZCZWBDmsQTcTqrLPTbNbwQQrrN
lzpFVfdjfFFGnVVHpjJGJVlprNMPNtPctTNwLtcTbwctwTnN
jVFfzVlFSpzpFCshWmgSRgmBRb
zZGFNPmdPdszdWddGWZlpLMLpbQbLDpblzQbtv
wTwgwSSCHhhCSghJbpcpDglbbQbMVMpV
BHnBRrJCHmRNfGDmfm
CffgvfCRGngRrvGvgdnRVpPQQPSqbVZZDPDVPzFSSQ
cMlWJTMlcTLTLtHHJlpqDLwqSzSSDDqDZDDS
tmHTtlMmWpmsMJsCRdCNsrRGfrnffN
lNrzNHNwzZlHmwNBpMqqnqGDZSpMTGnb
ddjgFjjsRvGvQhQvvFjqbVTFpbVpFDJSbJVpTS
cjsQhsjvRvGcgNtzczmtmwCCcr
NJMJvBmBJPtMtRDnDDwDMFFWDWHG
hZsrzshpSdjZZqSSfgpDwnwFnGCCLHDbjnGCWG
zfgSpScsrdpmllttGvJGcm
GLsnLVLZGZmcGVpgZLmTjTsDDTlDTHPPHWlHwD
dNJhCCdtNJSvdDzwPlvTlQ
BCbBrPPfRMfMJSffrMCMChrSqVcmLLFpqLFFcggLVnqgmbgc
hMdjMndZLRnRnjclszLclQlzGwcr
FPCCSCSpCwStJVGzsPQGslGzPbsQ
TSSJTtfTFTwtmTFFVFDTWRvdgndjjRhnjnvHjdfR
ZwgsnsWsWvWQHqJhGhJVCJHhCJ
cdjlMWRRMhJLCpLL
jjSRmRmNRNWBmdmcWjlDWFPswsPtnZQsnBsnZvvTTnvT
vvbjLTPbQzrQQjpLzLbflfjfRDDsDlRfgDnnVD
ZGCtHHFGzFHhMlCnDqwlgggsqf
FJHMhHZGmNHtJhMhBJZZtZdrbSbSzbmWLLQrQTbPdbrS
ZClGVCvLZzCLBVbdGGzVVBvVrqQMDWMHrgmgQLWrWmTgqqHH
tNpNspcQPfHmqfgHmHHg
nNttnwPRjFtPcccsFptPlllQGlQZbvGzVVVFzhCd
lflmVWpDVsMmmVPlHVbbGSSbGnSHJcncnLZn
NvTFzNwzTQvhFGSZnvgrbgJCgr
jtRwTQFzjBNGGQQBdDsDqqlsVqRflMlPsP
rCSJPCrBwwMdBJRCrwMTGWTWNbcjGZNGGZTb
qzgqfgFghsHzfgHgmmfWGNGGWcNNFClbWlcCNW
DqsnzsHLhddBDwCRJR
sZpHjZrVQmcrbhbthzhFHzhH
QDPMDMndqqQGqQfCDDbhFtzzLtbWzlBLLPBW
TDMDqfGnJSnfnfvgjsjNgJvsjVQv
bDZQbZHdQQggZfttJjGnplSnldsG
FTrFCvWBWzTNSPNvRBGJsGjpsJjstmCLtjCt
rhBvzRVRBBSVHDHcHMHq
FSbSNZbZbzGzGGbNzGgcZPwlDPvlNmLLLwLLlLvvvl
pqnqpVCrpshqmChsQnnRpRCldDHvDHLjDlvPwddlwPtwDV
rRTCnnpCWCChTrWsrBTfbcFFmFSSmfBBGg
QdhdWDsHhHWzPrLPSCPGvs
gpZZmNmtjZwpBZBZgSnvFcGPrrvmncnvmC
RVVRjZJfJVfVBZVtBNBVppZVDqMHhqTbMGlWHQhhWldRMHWd
BPWQrRRNNMhrHhLqqGgjDJjH
TzVmmpmtCNwscTzszcNzDCfCHJqDfGjDJJgfGCDq
wdwmspTsVdlTcpbmVMPWBbBWRPNnFnBWMr
VZTnVnsgrjjsqPzPwWgWPghz
mcFdQGPMBdMSBdWbhRzzWqwLwcWt
GQPBvpfvNvFPBvTnfjnZDHDDjsrr
CZssCNFJBmBNFmFBNwBFCJFTtthGrrSThtSgSRtSfRTGtRrg
LDpDbnjjDGpggGrvGg
PLMWnWQgbQWnWbnbjqDbszHwwzwmNsFZMBmwJFZF
hQSjFLhFLLMSSFgdWTMdGgNbNbWv
JmPlltJBJqmzpbrrwTwrvvGqww
HBzztRBRplzlmHmRmmsplRJZcfFcLFfHSLjSZTcfVVcLVH
nBSQMnVQqJBGnfVfDgCrjbVbtC
FNcPPHdTdhmBdHBvwlZjbClClfcZgjclgj
vFdHWhTLHvnBRRqBsWSR
TRsNNTTHRRZRRsRzJQddSpJLcQdpjs
DMVPVVGmMGWMGtMgGtDlmMWwLLLpJfSfpjzpdQddLSmSSJdc
tVMgGMDwMgMWDBWMttjRBZNnvNCNZrZZRbZNvZ
wlJPVMJPPBShSlhgfTvgNNzzgNMCTg
FLtRnDDSrvdNdrng
FcSmpFZFFmmjWqPWJbmhGqqm
hlBqqTlSfvNhpbfb
fRVsVDDRtnRVfbDNCCNCNQGwNZ
nrrRPPnHzntRrPsRVrtJVBMjlzWfFWdMjjWMqdBBlT
zDNcnRsNNfRFFNNzRzLbRWgMZMMZcdhcBdMrBpZmmZ
PVHHVlPDGPPtjDmmdrrGBBMpWGWd
VVqTTlQtDCqFNzsnbLbCSJ
ndSGSZZGwSZTBdwnwdwmWCzPQCQLffZzRgMZRggMzf
mvqVmqrmcDqllNNtbcNcMCQMRCMCCMQfHLgvRgMg
FhNNcrrVljFcqmTJhwnsmGdJsT
wlmLmZLwzvVmVWVmQWzZSFJFDSqFHSSFJHhDqZ
RsgpMNcMdRgjDcRFqCSrHSHBCFJr
jdncssDNPsbmmwvvlPLw
wQGHMrHGgwgVTQrrMGgGQrTtWzzPJhsfhZztWssQWbZCWh
FjvBFSqqDbljFvSbnvFltszfWPPfWzJZBCsPtJft
qLlDbpjFRbpdGTgLGLGTTV
hrVJsBrpwbsMZtTLlwnqtqdc
QDDmHWmffHCQWHjRQjCWczTTjtlzdldqVtTnTqLt
HmfGfRNWfNWmQCRsgbsMFMhMGvpBVs
CRzzVCZhvGQqNmcWrgpgwQFSmF
BJsttjDtjbdLMHHsBTqBbBHMrprDSrFnFnSgrnnrpDSmWWnw
TbMBMPPdLTbHTjHMtPzZGvzlvqCPGNlNVRVP
QcmcrCVcdTCGRRLT
zzgWFWVBTSWLPdMP
JbhnBVzzfVhgztVDvqcqHwncZHNqnsnccQ
JJVBFfJjNNNsJTwVfZJNffFRpRzRzRptRWtCtSSHWsWzCD
rmrnhgclhQGcGnhrPjqgGMHbWRHRbRCWbzRbMSSpHWCD
mhhjQGGjQgggqnmQnmghdQdJFZBNvZBBLNTvvTNNTLfZ
DrBgwMCMRvMrvDgPCzdpdNtzqqlHNNtp
jWSSZGgfGjcLfdNjFzqqFFzzFF
nGZhTmZLLZhGPVVTgQgMRrrb
ppqZvppdJmSLHdSfZRrrtbscgRVVgwVrHt
hFFFzQPhNWzNhnhGVggrcbwVgBnvbwgR
CNQWFMzWWhCflpjvZJMJdj
pfpfmQMWmcBVfMBBmpfVQMbDGGNPDTcSNTTsSNPCCNhC
ZZrZwvvzZrvZlZlwhwswhNSsgbDssC
ttvdtzRzFDqRJWLVLWJJpQ
CZZPTQPTPTJhTQTrHCBbvtLbbbRWtjbDvb
cGfsVSVcLdSgSwBWRNNGwRNRbD
spSffnccsgcdnnJJQlZZqJLhpMJh
TwGGdWwdddtTsbzPzbbnTLnPLP
gqNSMvtvcSDLLfnMnnPzFM
NvDNDqtvRcjQVGZZGZZhwpQB
jtgFmnqjqttQpsphzNllblzlNH
GRMRDMGCVCHzSCbSbNNl
LMTJRTGRLBJBwLRRHmBFQPvqmPBvtgtc
jDjjwRDpPqqsMsDLJbJzVB
lMNMNddvMltNfFVWbVVWJrrVLfgL
NQQtmtFGFlGZPZcMmmcjjn
CgCNjvSCgSQQzVZNWVnTBPTcsTVBnpPs
bFbbLfbfdRBFhLwqFmblBJfRHtWcttcttlDpspcPWDcDptPn
mdbFhfJrmJwfbmmFFFvBZCNCzMGrNjMQjCCZ
TPDNHHSTNNmRfTrRMZSqwwttdbBvBMth
VVnnFGgnQcBvMqvnhNBN
GLzjjzGscssJGJCHljmfmTWPTCDN
BZZNcMQjBNjNtDJgstjgtwqGRQfhGhSvPfThfqvPhfhf
CCndrnmnnWbrnHrFbWbpbbVmGGPqLfTGhvGSPhqRLRdfSGsf
bFssVbbblFHzrmFlMNMtcNgDtJDzZgtw
smjMtSqQQSjtSfmDVVFHFhnHBHmbNPPH
TgvCCJcZdwdgNvbHvPbbvBNq
JLqRWTgLqJLCJcclgCJdWjfsSSpsfRrsQjDtspptQQ
hNwztzgzJnnNTVFwNTNhwVhZlrpLMLZZlpZlQndLPLpQLZ
vRDvqSSqjbqSWDvjbvBdLWspPLddZPQQLMllLp
SfGfRmSGCSfBfjTcNFgzwMFJzwgm
lhVBhZjjPHbThwFGrNrdvNNwFV
DRrDLfMLSgpCdCJcfmcJCm
LQtnprtqSRtZjHzTthlb
GrGsqfbtsWGWWntnrrwWWWGSSDSMDcSSSwTDzPzJSJzPcT
lmQhhVCgmffCNgmNNmCmBNRRPvDzDMhJvSSDJzzcTzvvPvMT
VBllNBpfQgQmpLBpRBtnqWLFFnZZWWGrZrjq
NRJdngMVwfgnwJtvlblcWLlLDHfccDbW
PFJzBmhmjPFpJrFqLcQHLlHGDlHDQbGz
ShJZJmPFpwdMvCCZRd
WQDqSVWqpBCsPqPWWNscfrHfhrhrHhGFGs
MmLRmLTjmTzTzlhGHfprhvfFhHfT
mLZLRdgMRjtdddmdgwmtMwQSCPbnDSSCqBDwpWPQqn
rNHwMMGDrggWwsvWMPMWWwjbCqjCBlZqvfjBqCJhfffj
FbtFmRTpzBBZqCClpJ
ztbzFtnzVNnNNPPDGD
PLPFcwdLdFcbgdfSwFtWhGWGRMWMJMGCblJR
qTpszVVjRlCHtWCT
qzvrDqQrqznzggFZwFwQScdW
LWLjLNjNjTwlwLZVcBVcVVZcBVQcZZ
JhGhFdmBRdGGDnQtbPvVVdnccS
zDrrFGFFRgRHmDNWTpjTBNTHWNjW
fwfBVLhmwfhHsgBstWCWQnDQnlldWW
hZvFTNJrZjZbFvNvttqWWDtcWqCtFDWn
rbjjrjpRzRzgBLzwLgmzLh
ZqqqWVzdSPnwBJBfwJfZTs
FHGgjRLMJFsJTsBw
DHRcDgHvLhDWPSCzwqnq
LZGZLLRLZpRQBtPTjTffrHljjmsB
wNVVwcCgNCCScwggmjHjTPmQPsTHmlSs
gbbwbqhNCQcbqqVchWhtRZDJWJDtZLWL
CmTmvvmvzCCCgzzVQmTQvTjjGRGShwSHwRrRSSSSDNHSFN
PqZqWdqlplsqBJMMsMMnGRJRbbNwNhrrhShGShFD
fBWBWdZppqpqDMBdlfcTCTLtLtLCQfQvcmgv
pntdtdHHWHqnptGpqHqNgMQwPPPnZMZZZZcfgc
LFmLSVBRTSBBRrffTQgMfQMtJZQT
bmRCSSSjRCtSrRChjqqGqpppGhqDGp
dGGhhfNfgRTGLcpL
BmCCwQMQqmQrBCBJLpbVTFbHcgcbLTMc
JrpqJJmqqqqmzqqwmwNlzfvltDPltfshlhNN
VCCbMJfJlgRCnNGVNnvFvVBF
STsgcZdghZsqSttBnsGnBtBtHt
qDcjgDphjhSghZTQgCJWQWWfwfRzWlwJzJ
JHMVMvmvRcdbmrRHQBBGjcjfFQfChSfj
NltNtZllgZtgtnpnqNWpgCrCBQzBGzFhQrGSSBCzWh
pDrwnqLlvDVmPbss
dbrpbSrwBjswsSjCwqllLqFtqLcrGqqFtF
RvfJDQnRpHvvQfRvvQRJFDqzcWltFFlzcLttWltW
ZpnRVZHmvHnTnPZZPHfHmVwdjVghwgVSBgdBBCwgdC
WRCBGWvNgHnMcFwnpC
ltlstrjlJNlfrZZqDJtNLsHnmwwpcHphhFPMFjwhmnFp
TStJssLstJLtqTsNgvvSBNzzvWvGRz
VBjdWdGcqWdBVCFRmHwfCRRV
DLzNpqbDzDNbrJvltMLJLRRmtRFTSRmTmFwfRHRTFf
zvvJNLgNqGcnjgnP
JjdnFfbdbdQMbQzjtRcwcCvbvBqRBCwt
LlNHlWGprPCVVBsVzqNR
hLmgTlrpPPHrLprHrTTGggHWzhZFSJDfhMdnjjZfFfdFMjFz
bDbwRpCSRgqqMfMf
HzzPcPnhzlhsQzHhHnTggBBqTQTgVQqBqjZW
tnsrFccnzsDvGpNGqNtq
GmPsPrsSlswNmcLzMvnpnmMpLBCf
glDTZRDqRTjRCvjvfBpfCzvp
DHlJVhJRDTbqZDqSNVrNwtVrQwSSGs
nNnDwqDwFVgDwDnCgLnLpCVWdBMRpsPdMPPjRHRHHRdBWj
tQtfTtJtJmlTQrTtTlhfzrmdHzMMRMsBPPddjddBPPdWsB
bbhtQTfTTsmmbStnqGFGNDbFDgFVnw
dsVpDPBMHVdHpplpvdHjRjmmjRTMTFFrrTTFQq
LzzWZLGCzCWNjfmRfBhmQjZq
zSSSwJwSBzNtzLBbwbSGLzWVvcvpHdssDllVJgVHVcdDPv
RWfQBDTBLQWpDLNRZjZwHHddjHNhZdtv
ScCCzSszFzJccPHHvmjHvjhpmHsj
FPclgFVCbcngVgnpWQqqRfLBDBrR
cRLLVwcsctwmbVcszztwtRMvNrCpTggqFrTvvhCVpghBqh
PdSDGdnZQfGDfDjWjWWgvCqFhpqvpNZgCTTvrp
dGnDHWnSQdJPDSFLLcJmRzzLLLRRcl
lCSqlcCcBqBCCwGwnNWnnFwBHF
WMZLMPbPhQddRbMpbbLbRLLHDFgjFGDmFNZgNnDGNHGGjD
dTVPPQbPbMdQMzvVrWvczrCJqv
vzscdHcHZzHzCCHlQTTTCcslMGPStmSlpDDSSSgSPDNBmNtl
FWVMFhFMMqWhFVFbDBDDhpmpGtPSDpGG
fRLbFfwWWLnVjMdzzQHQJnnvQs
SmPdRbWZdSqqzSPmbdWFFQgcQnvncgQGQMMT
BfBLmVNjprVVNlVBrpBlHpNrgQFHGCGgvTQTMGFFgMCvgQcQ
BjjJfVLBfNffJbZDqtDsdzzm
NLgtLsSggjqgqpLLDjsjmcJfvpmFmmJmvPpwhBJB
lMnlZMtdCMrRRnRbTddWbVwcmPfFmhJwPfwJmvfwFvPl
MnRrnGWRbgQqtNGDjt
dSdrTbTtLJCcttcFVw
PhsgQQGPZshvpQZGgsrBllVFlHVpFllJJrFH
gqsGPgMZhgvQbzrzTfSzMTLf
pqbDdQWqCgBfbbfFfB
vtjnmzLcmhBdzTFgTsRP
LZGmjvJGGctnLtvcchSjmhcLqNHCwVdQZwDwWDNpCwqHdDwQ
wlMWSSHWShSMbDSwVhCrNjJmcrDmGRRCGCjN
FHZdHftFFQnqsQqsQttjvGrJccmdGGcrNdRNmG
pHpzPpQHpsPzPlzlbSgSSMLwzh
fCQDLlDQTSjbHDqH
ZhrsrZZZhcclwNswGGwbwF
rcWhlhlpMJpMZmgtBCzCttCCRfdp
zLnCMLNTvtGNpNvNjhRHgZhHvZdZHdjD
fSsWWqScTfJJqfJFFJwswhdHhhhdhDdjbjZbhhDj
WsWmfcqBWfTfsrntrLmplCLttm
ljssbqMMPbHPlsbcWZNLLsWJWRFvvZfW
SzgggDDwTzrQmDQgdSSWvdJLFGffRvZG
zCzCDCrznnTTmCbbpvlPHtCPtb
TZSwNPpcgpNPbwbhhbwrwJqh
BlCDtvvgLWGCLffGfLzLrMqnnbDDHbmnnnJrhnVJ
lzBjdCjCGCjfGjjLGBGGjlCSsRppcdpRNdRSPQcRPQZTgT
TsFTrvGmZGfvZfZFzNNZrhClmRcBgCMwQwQPCPMPRP
bpnnVVJtSDgRBwbQRwlR
jpSnqLpqDJDJLDjWDWLWvvzfZZvqvNsGTHGGFfZl
bzbzznqfCpzvhCSMfbCbpCFhtHGHHJdtHJGhFsmshJJG
DLWRLjRrmNPQjZZlQPsFGFggVcWcFddggdsg
rjrZPwwDRlLLBjQlRRlPDpmbqzpqnnCSCfTMwMqSvC
FmcGcjLRPjQwQjMQrwHQ
btJzJbVNdBJJtzTdGBbdBztGrQhhQWhMwHrhrHSHgHQfhMVS
JJDpdDTtCtzNptnTJBznnvLCCvcFqsRqFcvZclLGRR
"""
