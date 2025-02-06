import prisma from "@/lib/prisma";

export async function getProposedPremium(): Promise<string> {
    const data = await prisma.$queryRaw<
      { total: string }[]>`
      SELECT
    SUM(proposed_premium) AS total
    FROM
    quotation`;
    console.log(":::::",data)
    if (data.length > 0) return data[0].total;
    else return "0";
  }