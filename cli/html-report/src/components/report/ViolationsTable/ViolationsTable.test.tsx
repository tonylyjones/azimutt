import { render, screen } from "@testing-library/react"
import * as ReportContext from "../../../context/ReportContext"
import { ViolationsTable } from "./ViolationsTable"
import { reportContextFactory } from "@/context/reportContextTestTool"

describe("ViolationsTable", () => {
  test("Should render list of rules name loaded from context", () => {
    const contextValues = reportContextFactory({
      levels: [
        {
          level: "high",
          levelViolationsCount: 12,
          rules: [
            {
              name: "duplicated index",
              totalViolations: 5,
              level: "high",
              conf: {},
              violations: [
                {
                  message:
                    "Index mfa_factors_user_id_idx on auth.mfa_factors(user_id) can be deleted, it's covered by: factor_id_created_at_idx(user_id, created_at).",
                },
              ],
            },
            {
              name: "entity not clean",
              totalViolations: 1,
              level: "high",
              conf: {},
              violations: [
                {
                  message:
                    "Entity public.events has old analyze (2024-06-17T10:18:35.009Z).",
                },
              ],
            },
          ],
        },
      ],
    })
    jest
      .spyOn(ReportContext, "useReportContext")
      .mockImplementation(() => contextValues)
    render(<ViolationsTable />)
    expect(screen.getByText("duplicated index")).toBeDefined()
    expect(screen.getByText("entity not clean")).toBeDefined()
  })

  test("Should not render rule name if no violations", () => {
    const contextValues = reportContextFactory({
      levels: [
        {
          level: "high",
          levelViolationsCount: 12,
          rules: [
            {
              name: "duplicated index",
              totalViolations: 5,
              level: "high",
              conf: {},
              violations: [
                {
                  message:
                    "Index mfa_factors_user_id_idx on auth.mfa_factors(user_id) can be deleted, it's covered by: factor_id_created_at_idx(user_id, created_at).",
                },
              ],
            },
            {
              name: "entity not clean",
              totalViolations: 0,
              level: "high",
              conf: {},
              violations: [],
            },
          ],
        },
      ],
    })
    jest
      .spyOn(ReportContext, "useReportContext")
      .mockImplementation(() => contextValues)
    render(<ViolationsTable />)
    expect(screen.getByText("duplicated index")).toBeDefined()
    expect(screen.findByText("entity not clean")).toMatchObject({})
  })
})
