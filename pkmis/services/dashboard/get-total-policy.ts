import prisma from "@/lib/prisma";

export async function getTotalPolicy(): Promise<string> {
    const data = await prisma.$queryRaw<
      { total_policy: string }[]
    >`SELECT
    COUNT(policy_name) AS total_policy
    FROM
    insurance_policy`;
    console.log("hhhhh",data)
    if (data.length > 0) return data[0].total_policy;
    else return "0";
  }